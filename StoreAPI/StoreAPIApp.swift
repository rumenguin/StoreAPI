//
//  StoreAPIApp.swift
//  StoreAPI
//
//  Created by RUMEN GUIN on 04/01/23.
//

import SwiftUI

@main
struct StoreAPIApp: App {
    @StateObject private var storeModel = StoreModel()
    var body: some Scene {
        WindowGroup {
            CategoryListScreen()
                .environmentObject(storeModel)
        }
    }
}
