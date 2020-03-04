//
//  RatesViewViewModel.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 03/03/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import Combine

class RatesViewViewModel: ObservableObject {
    @Published var service = CurrencyService()
    @Published var loading = false

    func loadData() {
        self.loading = true
        service.fetchCurrency()
    }
}
