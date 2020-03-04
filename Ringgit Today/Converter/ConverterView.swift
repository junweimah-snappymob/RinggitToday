//
//  ConverterView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct ConverterView: View {
    @State private var selectedCurrenry = ""
    
    @ObservedObject var currencyRates = CurrenyModel()
    
    let rate = 0.240 // hardcoded rate for testing

    @State private var amountInMRY: String = ""
    @State private var amountInOthersCurrency: String = ""

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
            
            self.amountInOthersCurrency = self.numberFormatter(amount: doubleAmount * self.rate)
            
        })
        
        let otherCurrencyBinding = Binding<String>(get: {
            self.amountInOthersCurrency
        }, set: {
            self.amountInOthersCurrency = $0

            guard let doubleAmount = Double(self.amountInOthersCurrency) else {
                self.amountInMRY = ""
                return
            }
            
            self.amountInMRY = self.numberFormatter(amount: doubleAmount / self.rate)
        })
        
        //----------------------------------------
        // MARK:- Return the view
        //----------------------------------------
        return NavigationView {
            VStack(spacing: 60) {
                Text("Rates: \(numberFormatter(amount: rate))")

                //MYR
                HStack {
                    FlagImageView(flagName: "MYR")
                    
                    TextField("MYR", text: MYRBinding)
                        .modifier(ClearButtonModifier(text: $amountInOthersCurrency))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                
                //other currencies
                HStack {
                    Button(action: {
                        print("currencyRates : \(self.currencyRates.allRates)")
                    }) {
                        FlagImageView(flagName: "GBP")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    TextField("GBP", text: otherCurrencyBinding)
                    .modifier(ClearButtonModifier(text: $amountInOthersCurrency))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                
                Spacer()
                
            }.padding()
        .navigationBarTitle("Converter")
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
