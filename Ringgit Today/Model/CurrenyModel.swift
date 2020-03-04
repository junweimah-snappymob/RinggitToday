//
//  CurrenyModel.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 23/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import Foundation

class CurrenyModel: ObservableObject, Codable{
    //need this enum so that conformance to codable will work
    enum CodingKeys: CodingKey {
        case rates, date, base
    }
    
    @Published var rates: [String: Double] = ["": 0.00]
    @Published var base: String = ""
    @Published var date: String = ""
    
    var allCurrencies: [String] {
        return Array(rates.keys)
    }
    
    var allRates: [Double] {
        return Array(rates.values)
    }
    
    //can have as many init as possible
    //this will just let other place to declare CurrenyModel() to init
    init () { }
//
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        rates = try container.decode([String : Double].self, forKey: .rates)
        base = try container.decode(String.self, forKey: .base)
        date = try container.decode(String.self, forKey: .date)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(rates, forKey: .rates)
        try container.encode(base, forKey: .base)
        try container.encode(base, forKey: .base)
    }
}
