//
//  HomeModel.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation

class HomeModel {
//    enum CodingKeys: String, CodingKey {
//        case spotlight, products, cash
//    }
    
    struct Data: Codable {
        let spotlight: [Spotlight]
        let products: [Products]
        let cash: Cash
    }
}
