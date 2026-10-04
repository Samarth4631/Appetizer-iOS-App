import SwiftUI

struct AppetizerDetailView: View {

    @EnvironmentObject var order: Order

    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Food Image

            ZStack(alignment: .topTrailing) {

                Image(appetizer.imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 220)
                    .clipped()

                Button {
                    isShowingDetail = false
                } label: {
                    XDismissButton()
                }
                .padding(8)
            }

            // MARK: - Food Details

            VStack(spacing: 0) {

                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 14)
                    .padding(.horizontal)

                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)

                // MARK: - Nutrition

                HStack(spacing: 35) {

                    NutritionInfo(
                        title: "Calories",
                        value: appetizer.calories
                    )

                    NutritionInfo(
                        title: "Carbs",
                        value: (appetizer.carbs)
                    )

                    NutritionInfo(
                        title: "Protein",
                        value: appetizer.protein
                    )
                }
                .padding(.top, 14)

                Spacer()

                // MARK: - Add To Order

                Button {
                    order.add(appetizer: appetizer)
                    isShowingDetail = false
                } label: {
                    Text(
                        "₹\(appetizer.price, specifier: "%.2f") - Add To Order"
                    )
                }
                .modifier(StandardButtonStyle())
                .padding(.bottom, 20)
            }
            .frame(width: 300, height: 305)
            .background(Color(.systemBackground))
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}

// MARK: - Preview

#Preview {
    AppetizerDetailView(
        appetizer: MockData.sampleAppetizer,
        isShowingDetail: .constant(true)
    )
    .environmentObject(Order())
}

// MARK: - Nutrition Info

struct NutritionInfo: View {

    let title: String
    let value: Int

    var body: some View {
        VStack(spacing: 5) {

            Text(title)
                .font(.caption)
                .fontWeight(.bold)

            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
