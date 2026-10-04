import Foundation

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func getAppetizers(
        completed: @escaping (Result<[Appetizer], APError>) -> Void
    ) {

        guard let url = Bundle.main.url(
            forResource: "appetizers",
            withExtension: "json"
        ) else {
            print("❌ appetizers.json not found")
            completed(.failure(.invalidURL))
            return
        }

        DispatchQueue.global(qos: .userInitiated).async {

            do {
                let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()

                let decodedResponse = try decoder.decode(
                    AppetizerResponse.self,
                    from: data
                )

                DispatchQueue.main.async {
                    print("✅ Received \(decodedResponse.request.count) appetizers")
                    completed(.success(decodedResponse.request))
                }

            } catch {
                print("❌ JSON ERROR: \(error)")

                DispatchQueue.main.async {
                    completed(.failure(.invalidData))
                }
            }
        }
    }
}
