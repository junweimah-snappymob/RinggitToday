//
//  ConverterView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI
import Combine

struct ConverterView: View {
    //----------------------------------------
    // MARK:- Private Properties
    //----------------------------------------
    @State private var selectedCurrenry = ""
    @State private var selectedCurrencyRate = 0.00
    @State private var userSelectedOtherCurrency = false

    @State private var amountInMRY: String = ""
    @State private var amountInOthersCurrency: String = ""
    
    @EnvironmentObject var service: CurrencyService
    
    var body: some View {
        
        //----------------------------------------
        // MARK:- Binding variables
        //----------------------------------------
        let MYRBinding = Binding<String>(get: {
            self.amountInMRY
        }, set: {
            self.amountInMRY = $0
            
            guard let doubleAmount = Double(self.amountInMRY) else {
                self.amountInOthersCurrency = ""
                return
            }
            
            self.amountInOthersCurrency = self.numberFormatter(amount: doubleAmount * self.selectedCurrencyRate)
        })
        
        let otherCurrencyBinding = Binding<String>(get: {
            self.amountInOthersCurrency
        }, set: {
            self.amountInOthersCurrency = $0
            
            guard let doubleAmount = Double(self.amountInOthersCurrency) else {
                self.amountInMRY = ""
                return
            }
            
            self.amountInMRY = self.numberFormatter(amount: doubleAmount / self.selectedCurrencyRate)
        })
        
        //----------------------------------------
        // MARK:- Return the view
        //----------------------------------------
        return NavigationView {
            VStack {
                if service.state == .loading {
                    ActivityIndicator()
                } else if service.state == .error {
                    Text("Error")
                } else {
                    VStack(spacing: 30) {
                        Text("Rates: \(numberFormatter(amount: selectedCurrencyRate))")
                        
                        // MYR
                        HStack(spacing: 25) {
                            FlagImageView(flagName: "MYR")
                            
                            TextField("MYR", text: MYRBinding)
                                .modifier(ClearButtonModifier(text: $amountInOthersCurrency))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                        }
                        
                        // other currencies
                        HStack {
                            
                            Button(action: {
                                print("currencyRates : \(self.service.currencyModel.allCurrencies)")
                            }) {
                                NavigationLink(destination: CurrencyListView(currencyArray: self.service.currencyModel.allCurrencies, closure: { (index) -> () in
                                    self.selectedCurrenry = self.service.currencyModel.allCurrencies[index]
                                    self.selectedCurrencyRate = self.service.currencyModel.allRates[index]
                                    self.userSelectedOtherCurrency = true
                                })) {
                                    FlagImageView(flagName: selectedCurrenry)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Image(systemName: "arrow.right")
                                .frame(width: 10, height: 10)
                            
                            TextField(selectedCurrenry, text: otherCurrencyBinding)
                                .modifier(ClearButtonModifier(text: $amountInOthersCurrency))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                        }
                        
                        Spacer()
                        
                    }
                    .onAppear(perform: setFirstData)
                    .padding()
                    .navigationBarTitle("Converter")
                }
            }
        }
        .modifier(DismissingKeyboard())
    }
    
    //----------------------------------------
    // MARK:- Private methods
    //----------------------------------------
    private func setFirstData() {
        if !userSelectedOtherCurrency {
            selectedCurrenry = service.currencyModel.rates["USD"] != nil ? "USD" : ""
            selectedCurrencyRate = service.currencyModel.rates["USD"] ?? 0.00
        }
    }
    
    private func numberFormatter(amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        // formatter.locale = NSLocale.currentLocale() // This is the default
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
