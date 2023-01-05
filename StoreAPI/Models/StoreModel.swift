//
//  StoreModel.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//

import Foundation

@MainActor //set or assigned on main queue
class StoreModel: ObservableObject {
    let client = StoreHTTPClient()
    //nobody from outside can set the categories/products
    @Published private(set) var categories: [Category] = []
    @Published private(set) var products: [Product] = []
    
    func fetchCategories() async throws {
        categories = try await client.load(Resource(url: URL.allCategories))
        //categories = try await client.getCategories(url: URL.allCategories)
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        
        products = try await client.load(Resource(url: URL.productsByCategory(categoryId)))
        
        //products = try await client.getProductByCategory(url: URL.productsByCategory(categoryId))
    }
    
    func saveProduct(_ createProductRequest: CreateProductRequest)async throws {
        let data = try JSONEncoder().encode(createProductRequest)
        let product: Product = try await client.load(Resource(url: URL.saveProduct, method: .post(data)))
        products.append(product)
    }
}
