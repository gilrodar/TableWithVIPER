//
//  Category.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 15/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation

struct Category: Codable {
    
    let _links: Links
    
    struct Links: Codable {
        let links: [DatoURL]
        
        enum CodingKeys: String, CodingKey {
            case links = "self"
        }
    }
    
    struct DatoURL: Codable {
        let href: String
    }
    
}
