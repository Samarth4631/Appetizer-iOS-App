import SwiftUI

struct RemoteImage: View {

    let imageName: String

    var body: some View {
        if let uiImage = UIImage(named: imageName) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            VStack {
                Image(systemName: "photo")
                    .font(.largeTitle)

                Text("Missing")
                    .font(.caption)

                Text(imageName)
                    .font(.caption2)
            }
        }
    }
}
