//
//  Repositories.swift
//  AlamofireWithCodableExample
//
//  Created by Marcos Lacerda on 12/09/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

struct Repositories: Codable {
    
    let name: String
    let owner: Owner
    
    // Optional because the "description" attribute accept 'null' values
    var text: String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "full_name"
        case owner
        case text = "description"
    }
    
}
