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

enum state {
    case loading
    case error
    case populate
    case empty
}

class CurrencyService: ObservableObject {
    @Published var currencyModel = CurrenyModel()
    @Published var state: state!
    
    func fetchCurrency() {
        guard let url = URL(string: "https://api.exchangeratesapi.io/latest?base=MYR") else {
            fatalError("invalid URL")
        }
        
        let request = URLRequest(url: url)
        
        state = .loading
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                //                self.showError = true
                //                self.alertTitle = "Error"
                //                self.alertMessage = error.debugDescription
                
                // Publishing changes from background threads is not allowed;
                // make sure to publish values from the main thread
                DispatchQueue.main.async {
                    self.state = .error
                }
                return
            }
            
            // timer to test loading indicator
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                self.currencyModel = JSONDecoder().decode(data)
                self.state = .populate
            }
            
            //            DispatchQueue.main.async {
            //                self.currencyModel = JSONDecoder().decode(data)
            //                self.isLoading = false
            //            }
        }.resume()
    }
}
