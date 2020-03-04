//
//  RatesView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI
import Combine

struct RatesView: View {
    @State private var showError = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    //just use an ObservedObject service, in that class, call api, and will reflect here
    @ObservedObject var service = CurrencyService()
    
    @EnvironmentObject var currenyModel: CurrenyModel
    
//    @ObservedObject var viewmodel = RatesViewViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(service.currencyModel.allCurrencies, id: \.self) { rate in
                    HStack {
                        RatesRow(currency: rate, rate: self.service.currencyModel.rates[rate]!)
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
