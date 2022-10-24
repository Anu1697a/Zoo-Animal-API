import SwiftUI

struct AnimalDetailview: View {
    @ObservedObject var viewModel: AnimalDetailViewModel
    @AppStorage("height") var storedHeight: Height = .Feet
    @AppStorage("weight") var storedWeight: Weight = .Pounds
    
    var body: some View {
        ScrollView {
            VStack {
                
                if let urlString = viewModel.animal.imageLink, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                }
                Section {
                    Text("Name")
                        .font(.headline)
                    Text("\(viewModel.animal.name)- \(viewModel.animal.latinName)")
                        .font(.body)
                }
                
                Section {
                    Text("Minimum - Maximum Weight")
                        .font(.headline)
                    Text(viewModel.getWeight(unit: storedWeight))
                        .font(.body)
                }
                
                Section {
                    Text("Minimum - Maximum Height")
                        .font(.headline)
                    Text(viewModel.getHeight(unit: storedHeight))
                        .font(.body)
                }
                
                
                Spacer()
            }
        }
    }
}
