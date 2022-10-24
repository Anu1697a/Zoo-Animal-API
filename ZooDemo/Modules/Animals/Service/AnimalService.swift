import Foundation

protocol AnimalService {
    func fetchAnimals(limit: Int, completion: @escaping (Result<[Animal], Error>) -> Void)
}
