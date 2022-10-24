import Foundation

class AnimalDetailViewModel: ObservableObject {
    
    let animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    func getWeight(unit: Weight) -> String {
        switch unit {
        case .Pounds:
            return "\(animal.weightMin)lb - \(animal.weightMax)lb"
        case .Stones:
            let minWeight = Double(animal.weightMin)!/14
            let maxWight = Double(animal.weightMax)!/14
            return "\(String(format: "%.2f", minWeight))st - \(String(format: "%.2f", maxWight))st"
        case .Kilograms:
            let minWeight = Double(animal.weightMin)!/2.2046
            let maxWight = Double(animal.weightMax)!/2.2046
            return "\(String(format: "%.2f", minWeight))kg - \(String(format: "%.2f", maxWight))kg"
        }
    }
    
    func getHeight(unit: Height) -> String {
        switch unit {
        case .Feet:
            return "\(animal.lengthMin)ft - \(animal.lengthMax)ft"
        case .Centimetres:
            let lengthMin = Double(animal.lengthMin)!*30
            let lengthMax = Double(animal.lengthMax)!*30
            return "\(String(format: "%.2f", lengthMin))cm - \(String(format: "%.2f", lengthMax))cm"
        case .Metres:
            let lengthMin = Double(animal.lengthMin)!*0.3048
            let lengthMax = Double(animal.lengthMax)!*0.3048
            return "\(String(format: "%.2f", lengthMin))m - \(String(format: "%.2f", lengthMax))m"
        }
    }
    
}

