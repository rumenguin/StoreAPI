//
//  CreateProductRequest.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//
/*
 [POST] https://api.escuelajs.co/api/v1/products/
 # Body
 {
   "title": "New Product",
   "price": 10,
   "description": "A description",
   "categoryId": 1,
   "images": ["https://placeimg.com/640/480/any"]
 }

 */
import Foundation

struct CreateProductRequest: Encodable {
    let title: String
    let price: Double
    let description: String
    let categoryId: Int
    let images: [URL]
}
