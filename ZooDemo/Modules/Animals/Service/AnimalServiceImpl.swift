import Foundation

class AnimalServiceImpl: AnimalService {
        
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }

    func fetchAnimals(limit: Int, completion: @escaping (Result<[Animal], Error>) -> Void) {
        let request = NetworkRequest(path: "animals/rand/\(limit)", method: .get)
        self.networkManager.request(request: request, completion: completion)
    }
}
