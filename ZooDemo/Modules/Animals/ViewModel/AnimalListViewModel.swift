import Foundation


class AnimalListViewModel: ObservableObject {
    @Published var animals = [Animal]()
    
    
    private let service: AnimalService
    
    init(service: AnimalService = AnimalServiceImpl(networkManager: NetworkManager())) {
        self.service = service
    }
    
    func fetchAnimals(limit: Int) {
        service.fetchAnimals(limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let animalresponse):
                    self?.animals = animalresponse
                case .failure(_):
                    break
                }
            }
        }
    }
    
}
