//
//  HeroResponse.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 16/02/21.
//

import Foundation

class HeroResponse {
    var totalItens: Int
    var count: Int
    var offset: Int
    var results: [Hero]
    
    init(jsonMap: Dictionary<String, Any>) {
        totalItens = jsonMap[CodingKeys.totalItens.rawValue] as? Int ?? 0
        count = jsonMap[CodingKeys.count.rawValue] as? Int ?? 0
        offset = jsonMap[CodingKeys.offset.rawValue] as? Int ?? 0
        totalItens = jsonMap[CodingKeys.totalItens.rawValue] as? Int ?? 0
        results = []
        
        guard let jsonResultsMap = jsonMap["results"] as? [Dictionary<String, Any>] else {print("Não converteu results");  return }
        
        jsonResultsMap.forEach{ result in
            results.append(Hero(jsonData: result))
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case count
        case offset
        case results
        case totalItens = "total"
    }
}
