//
//  AddProductScreen.swift
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
import SwiftUI

struct AddProductScreen: View {
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var selectedCategory: Category?
    @State private var imageUrl: String = ""
    @State private var errorMessage: String = ""
    @EnvironmentObject private var storeModel: StoreModel
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        !title.isEmpty && selectedCategory != nil && !imageUrl.isEmpty && !description.isEmpty && !price.isZero
    }
    
    private func saveProduct() {
        guard let category = selectedCategory,
              let imageURL = URL(string: imageUrl)
        else {return}
        
        let createProductRequest = CreateProductRequest(title: title, price: price, description: description, categoryId: category.id, images: [imageURL])
        
        Task {
            do {
                try await storeModel.saveProduct(createProductRequest)
                dismiss()
            }catch {
                errorMessage = "unable to save product"
            }
        }
        
    }
    
    
    var body: some View {
        Form {
            TextField("Enter text", text: $title)
            TextField("Enter price", value: $price, format: .number)
            TextField("Enter description", text: $description)
            
            Picker("Categories", selection: $selectedCategory) {
                ForEach(storeModel.categories, id: \.id) {category in
                    Text(category.name)
                }
            }
            .pickerStyle(.wheel)
            TextField("Image Url", text: $imageUrl)

        }
        .navigationTitle("Add Product")
        .onAppear {
            selectedCategory = storeModel.categories.first
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    if isFormValid {
                        saveProduct()
                    }
                }
            }
        }
    }
}

//struct AddProductScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductScreen()
//    }
//}
