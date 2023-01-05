//
//  URL+Extensions.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 04/01/23.
//
//Platzi Fake Store API:
//https://fakeapi.platzi.com/ -> GET call
import Foundation

extension URL {
    static var development: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var production: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var `default` : URL {
        #if DEBUG
            return development
        #else
            return production
        #endif
    }
    
    static var saveProduct: URL {
        return URL(string: "/api/v1/products/", relativeTo: Self.default)!
    }
    
    static var allCategories: URL {
        URL(string: "/api/v1/categories", relativeTo: Self.default)!
    }
    
    static func productsByCategory(_ categoryId: Int) -> URL {
        return URL(string: "/api/v1/categories/\(categoryId)/products", relativeTo: Self.default)!
    }
}
