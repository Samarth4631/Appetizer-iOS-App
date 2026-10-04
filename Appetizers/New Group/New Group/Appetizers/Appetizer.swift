import Foundation

nonisolated struct Appetizer: Decodable, Identifiable {

    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

nonisolated struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {

    static var sampleAppetizer = Appetizer(
        id: 1,
        name: "Chole Bhature",
        description: "Spiced chickpea curry served with fluffy, deep-fried bhature.",
        price: 149,
        imageURL: "chole-bhature",
        calories: 420,
        protein: 12,
        carbs: 58
    )

    static let appetizers = [
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer
    ]

    static var orderItemOne  = Appetizer(
        id: 1,
        name: "Test Appetizer 1",
        description: "This is the description for my appetizer. It's yummy",
        price: 149,
        imageURL: "",
        calories: 420,
        protein: 12,
        carbs: 58
    )

    static var orderItemTwo  = Appetizer(
        id: 2,
        name: "Test Appetizer 2",
        description: "This is the description for my appetizer. It's yummy",
        price: 149,
        imageURL: "",
        calories: 420,
        protein: 12,
        carbs: 58
    )

    static var orderItemThree  = Appetizer(
        id: 3,
        name: "Test Appetizer 3",
        description: "This is the description for my appetizer. It's yummy.",
        price: 149,
        imageURL: "",
        calories: 420,
        protein: 12,
        carbs: 58
    )

    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]

}
