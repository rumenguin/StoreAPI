//
//  ProductCellView.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//

import SwiftUI

struct ProductCellView: View {
    var product: Product
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(product.title)
                    .bold()
                Spacer()
                Text(product.price, format: .currency(code: Locale.currencyCode))
                    .padding(4)
                    .foregroundColor(.white)
                    .background {
                        Color.green
                    }.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }
        Text(product.description)
    }
}

//struct ProductCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCellView()
//    }
//}
