//
//  ProductDetailScreen.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//

import SwiftUI

struct ProductDetailScreen: View {
    var product: Product
    
    init(product: Product) {
        self.product = product
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            ScrollView(.horizontal) {
                ForEach(product.images ?? [], id: \.self) {imageUrl in
                    AsyncImage(url: imageUrl) {image in
                        image.resizable()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                    }placeholder: {
                        ProgressView()
                    }
                }
            }
            
            Text(product.description)
            Text(product.price, format: .currency(code: Locale.currencyCode))
                .padding(4)
                .foregroundColor(.white)
                .background {
                    Color.green
                }.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            Spacer()
        }
        .padding()
        .navigationTitle(product.title)
    }
}

//struct ProductDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailScreen()
//    }
//}
