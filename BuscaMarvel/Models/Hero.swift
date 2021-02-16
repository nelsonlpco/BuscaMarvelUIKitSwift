//
//  Hero.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 16/02/21.
//

import UIKit

class Hero {
    var id: Int;
    var name: String
    var resourceURI: String?
    var description: String?
    
    init(jsonData: Dictionary<String, Any>) {
        id = jsonData[CodingKeys.id.rawValue] as? Int ?? 0
        name = jsonData[CodingKeys.name.rawValue] as? String ?? ""
        
        description = jsonData[CodingKeys.description.rawValue] as? String ?? ""
        
        guard let thumbnail = jsonData["thumbnail"] as? Dictionary<String, String> else { return }
        
        let thumbPath = thumbnail["path"] ?? ""
        let thumbExt = thumbnail["extension"] ?? ""
        
        resourceURI = "\(thumbPath).\(thumbExt)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resourceURI
        case description
    }
}
