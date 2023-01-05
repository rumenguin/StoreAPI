//
//  ProductListScreen.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//

import SwiftUI

struct ProductListScreen: View {
    @EnvironmentObject private var storeModel: StoreModel
    @State private var isPresented: Bool = false
    let category: Category
    var body: some View {
        List(storeModel.products, id: \.id) {product in
            NavigationLink(value: product) {
                ProductCellView(product: product)
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailScreen(product: product)
            }
        }
        .task {
            do {
                try await storeModel.fetchProductsByCategory(category.id)
            }catch {
                print(error)
            }
        }
        .navigationTitle(category.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Product") {
                    isPresented = true
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                AddProductScreen()
            }
        }
    }
}

//struct ProductListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductListScreen()
//    }
//}
