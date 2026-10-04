import SwiftUI

struct AppetizerListView: View {

    @StateObject private var viewModel = AppetizerListViewModel()

    var body: some View {
        ZStack {

            // MARK: - Home Screen

            NavigationView {

                List(viewModel.appetizers) { appetizer in

                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            // Blur the Home screen
            .blur(radius: viewModel.isShowingDetail ? 12 : 0)
            // Completely disable scrolling/tapping behind popup
            .allowsHitTesting(!viewModel.isShowingDetail)

            // MARK: - Blur Overlay

            if viewModel.isShowingDetail {

                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                    .allowsHitTesting(true)
            }

            // MARK: - Detail Popup

            if viewModel.isShowingDetail,
               let selectedAppetizer = viewModel.selectedAppetizer {

                AppetizerDetailView(
                    appetizer: selectedAppetizer,
                    isShowingDetail: $viewModel.isShowingDetail
                )
            }

            // MARK: - Loading

            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in

            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    AppetizerListView()
        .environmentObject(Order())
}
