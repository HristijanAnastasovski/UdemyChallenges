//
//  CoinDTO.swift
//  ByteCoin
//
//  Created by Hristijan Anastasovski on 4/23/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class CoinDTO: Codable {
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
}
