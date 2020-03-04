//
//  GetCurrencyService.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 24/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import Foundation

// not being used now
// TODO: find out how to return a Result generic that I can return .success(data) and .error(error)
enum Result<T> {
    case success(T)
    case error(Error)
}

class CurrencyService: ObservableObject {
    @Published var currencyModel = CurrenyModel()
    
    init() {
        fetchCurrency()
    }

    func fetchCurrency() {
        guard let url = URL(string: "https://api.exchangeratesapi.io/latest?base=MYR") else {
            fatalError("invalid URL")
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
//                self.showError = true
//                self.alertTitle = "Error"
//                self.alertMessage = error.debugDescription
                return
            }
            
            DispatchQueue.main.async {
                self.currencyModel = JSONDecoder().decode(data)
            }
            
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(CurrenyModel.self, from: data) {
//                    // we have good data – go back to the main thread
//                    DispatchQueue.main.async {
//                        self.currencyModel = decodedResponse
//                    }
//                    return
//                } else {
////                    self.showError = true
////                    self.alertTitle = "Error"
////                    self.alertMessage = "Unable to decode data"
//                    return
//                }
//            }
        }.resume()
    }
}
