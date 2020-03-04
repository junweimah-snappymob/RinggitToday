//
//  Decoder-Helper.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 04/03/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Codable>(_ file: Data?) -> T {
        guard let data = file else {
            fatalError("data is nil")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(data)")
        }
        return loaded
    }
}


