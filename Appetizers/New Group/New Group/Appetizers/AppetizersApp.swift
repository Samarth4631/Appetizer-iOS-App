//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by samarth srivastava  on 30/09/26.
//

import SwiftUI

@main
struct AppetizersApp: App {

    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
