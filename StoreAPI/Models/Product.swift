//
//  Product.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//
/*
 https://api.escuelajs.co/api/v1/categories
 
 [
   {
     "id": 4,
     "title": "Handmade Fresh Table",
     "price": 687,
     "description": "Andy shoes are designed to keeping in...",
     "category": {
       "id": 1,
       "name": "Others",
       "image": "https://placeimg.com/640/480/any?r=0.591926261873231"
     },
     "images": [
       "https://placeimg.com/640/480/any?r=0.9178516507833767",
       "https://placeimg.com/640/480/any?r=0.9300320592588625",
       "https://placeimg.com/640/480/any?r=0.8807778235430017"
     ]
   }
   // ...
 ]
 */
import Foundation

struct Product: Codable ,Hashable{
    var id: Int? //Nullable, Optional
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
}
