//
//  CurrencyListView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 04/03/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct CurrencyListView: View {
    var currencyArray: [String] = [""]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var closure: ((Int) -> ())

    var body: some View {
        List {
            ForEach(currencyArray, id: \.self) { currency in
                HStack(spacing: 50) {
                    Spacer()
                    
                    FlagImageView(flagName: currency)
                    
                    Text(currency)
                        .font(.headline)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            self.presentationMode.wrappedValue.dismiss()
                            guard let index = self.currencyArray.lastIndex(of: currency) else {
                                return
                            }
                            self.closure(index)
                        }
                )
                
            }
        }
        .navigationBarTitle("Currency", displayMode: .inline)
    }
}
