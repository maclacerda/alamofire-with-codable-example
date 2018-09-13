//
//  SearchResult.swift
//  AlamofireWithCodableExample
//
//  Created by Marcos Lacerda on 12/09/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    
    let items: [Repositories]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
}
