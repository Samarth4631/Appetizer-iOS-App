import SwiftUI

struct AppetizerListCell: View {

    let appetizer: Appetizer

    var body: some View {

        HStack(spacing: 16) {

            RemoteImage(
             imageName: appetizer.imageURL
            )
            .frame(width: 120, height: 120)
            .cornerRadius(10)
           .clipped()





            VStack(alignment: .leading, spacing: 8) {

                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .lineLimit(2)

                Text(
                    "₹\(appetizer.price, specifier: "%.2f")"
                )
                .font(.headline)
                .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    AppetizerListCell(
        appetizer: MockData.sampleAppetizer
    )
}
