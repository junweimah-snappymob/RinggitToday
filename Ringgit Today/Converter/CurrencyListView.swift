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
                
            }
        }
        .navigationBarTitle("Currency", displayMode: .inline)
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView()
    }
}
