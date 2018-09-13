//
//  Owner.swift
//  AlamofireWithCodableExample
//
//  Created by Marcos Lacerda on 12/09/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

struct Owner: Codable {
    
    let login: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatar = "avatar_url"
    }
    
}
