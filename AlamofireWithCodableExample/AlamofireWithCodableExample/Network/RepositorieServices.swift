//
//  RepositorieServices.swift
//  AlamofireWithCodableExample
//
//  Created by Marcos Lacerda on 12/09/18.
//  Copyright © 2018 Marcos Lacerda. All rights reserved.
//

import Foundation
import Alamofire

class RepositorieServices: NSObject {
    
    public static let shared = RepositorieServices()
    
    fileprivate override init() {}
    
    func loadRepositories(_ term: String, handler: @escaping (([Repositories]?, String?) -> Void)) {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(term)+language:swift") else {
            handler(nil, "URL format error")
            return
        }
        
        Alamofire.request(url).responseJSON { response in
            if let data = response.data {
                guard let result = try? JSONDecoder().decode(SearchResult.self, from: data) else {
                    handler(nil, "Error to parse objects")
                    return
                }
                
                handler(result.items, nil)
            } else {
                handler(nil, "Request error")
                return
            }
        }
    }
    
}
