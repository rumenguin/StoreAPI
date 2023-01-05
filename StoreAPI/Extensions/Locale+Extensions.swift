//
//  Locale+Extensions.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 05/01/23.
//

import Foundation

extension Locale {
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
}
