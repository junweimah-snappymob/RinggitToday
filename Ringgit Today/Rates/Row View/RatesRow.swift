//
//  RatesRow.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 23/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct RatesRow: View {
    var currency = ""
    var rate: Double = 0.0

    var body: some View {
        HStack {
            FlagImageView(flagName: currency)
            
            Text(currency)
                .font(.headline)
                .padding()
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(currency + " ")\(rate, specifier: "%.3f")")
                    .font(.headline)
                Text("RM 1.00")
                    .font(.subheadline)
            }
        }.padding()
    }
}

struct RatesRow_Previews: PreviewProvider {
    static var previews: some View {
        RatesRow()
    }
}
