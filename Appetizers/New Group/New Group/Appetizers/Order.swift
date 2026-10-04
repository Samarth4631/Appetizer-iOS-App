//
//  Order.swift
//  Appetizers
//
//  Created by samarth srivastava  on 04/10/26.
//

import SwiftUI
import Combine

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []

    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }

    func add( appetizer: Appetizer) {
        items.append(appetizer)
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

}
