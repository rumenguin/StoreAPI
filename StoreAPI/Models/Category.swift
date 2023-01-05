//
//  Category.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    let name: String
    let image: URL
}

/*
 [
   {
     "id": 1,
     "name": "Clothes",
     "image": "https://api.lorem.space/image/fashion?w=640&h=480&r=4278"
   }
   // ...
 ]

 */
