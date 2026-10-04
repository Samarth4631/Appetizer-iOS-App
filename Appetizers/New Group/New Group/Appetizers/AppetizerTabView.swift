import SwiftUI

struct AppetizerTabView: View {

    @EnvironmentObject var order: Order

    var body: some View {
        TabView {


            AppetizerListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }


            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }

        
            OrderView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .accentColor(.appBrandPrimary)
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}



