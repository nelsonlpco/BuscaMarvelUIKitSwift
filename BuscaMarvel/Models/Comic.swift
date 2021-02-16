//
//  Comics.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 16/02/21.
//

import UIKit

struct Item: Decodable {
    var name: String
    var resourceURI: String
}

struct Comics: Decodable {
    var available: Int
    var collectionURI: String
    var returned: Int
    var items: [Item]
}
