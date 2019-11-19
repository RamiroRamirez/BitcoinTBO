//
//  BitcoinData.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

struct BitcoinData: Codable {
    var bitcoinSubdata: BitcoinSubdata
    
    enum CodingKeys: String, CodingKey {
        case bitcoinSubdata = "Data"
    }
}
