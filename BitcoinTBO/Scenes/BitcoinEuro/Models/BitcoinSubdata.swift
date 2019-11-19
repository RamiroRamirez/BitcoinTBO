//
//  BitcoinSubdata.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

struct BitcoinSubdata: Codable {
    var bitcoinDayInformations: [BitcoinDayInformation]
    
    enum CodingKeys: String, CodingKey {
        case bitcoinDayInformations = "Data"
    }
}
