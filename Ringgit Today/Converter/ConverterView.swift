//
//  ConverterView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct ConverterView: View {
    @State private var amountInMRY:String = ""
    
    @State private var amountInOthersCurrency:String = ""

    @State private var selectedCurrenry = ""
    
    @ObservedObject var currencyRates = CurrenyModel()
    
    let rate = 0.24 // hardcoded rate for testing

    var body: some View {
        
        return NavigationView {
            VStack(spacing: 60) {
                Text("MYR: \(amountInMRY)")
                Text("Others: \(amountInOthersCurrency)")

                //MYR
                HStack {
                    FlagImageView(flagName: "MYR")
                    
                    TextField("MYR", text: $amountInMRY).onReceive(amountInMRY.publisher.last(), perform: { (output) in
                        guard let doubleAmount = Double(self.amountInMRY) else {
                            self.amountInOthersCurrency = ""
                            return
                        }
                        
                        self.amountInOthersCurrency = String(doubleAmount * self.rate)
                    })
                    .modifier(ClearButtonModifier(text: $amountInMRY))
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
                    
                    TextField("GBP", text: $amountInOthersCurrency).onReceive(amountInOthersCurrency.publisher.last(), perform: { (output) in
                        guard let doubleAmount = Double(self.amountInOthersCurrency) else {
                            self.amountInMRY = ""
                            return
                        }
                        
                        self.amountInMRY = String(doubleAmount / self.rate)
                    })
                    .modifier(ClearButtonModifier(text: $amountInOthersCurrency))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                
                Spacer()
                
            }.padding()
        .navigationBarTitle("Converter")
        }
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
