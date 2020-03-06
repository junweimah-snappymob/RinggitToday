//
//  RatesView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct RatesView: View {
    @State private var showError = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @EnvironmentObject var service: CurrencyService
    
    var body: some View {
        NavigationView {
            VStack {
                if service.state == .loading {
                    ActivityIndicator()
                } else if (service.state == .error) {
                    Text("Error")
                } else {
                    List {
                        Section(header: Text("As of: \(service.currencyModel.date)")) {
                            ForEach(service.currencyModel.allCurrencies, id: \.self) { rate in
                                HStack {
                                    RatesRow(currency: rate, rate: self.service.currencyModel.rates[rate]!)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Rates")
        }
        .alert(isPresented: $showError) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct RatesView_Previews: PreviewProvider {
    static var previews: some View {
        RatesView()
    }
}
