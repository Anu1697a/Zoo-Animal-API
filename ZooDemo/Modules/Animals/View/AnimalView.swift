import SwiftUI

struct AnimalView: View {
    @ObservedObject var viewModel = AnimalListViewModel()
    @State private var limit: String = ""
    @State private var showingPopover = false
    @State private var viewAppeared = false
    
    var body: some View {
        NavigationView {
            List(viewModel.animals, id: \.self) { animal in
                NavigationLink(destination: AnimalDetailview(viewModel: AnimalDetailViewModel(animal: animal))) {
                    AnimalRowView(animal: animal)
                }
            }
            .navigationTitle("Animal List")
            .toolbar {
                Button("Refresh") {showingPopover = true}
                
            }
            .onChange(of: limit) { newValue in
                if let intValue = Int(newValue) {
                    viewModel.fetchAnimals(limit: intValue)
                }
            }
            .popover(isPresented: $showingPopover) {
                OptionSelectorView(selection: $limit, showSheet: $showingPopover)
            }
            .onAppear {
                if viewAppeared == false {
                    showingPopover = true
                    viewAppeared = true
                }
            }
        }
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}




struct AnimalRowView: View {
    let animal: Animal
    
    var body: some View {
        HStack {
            if let urlString = animal.imageLink, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            }
            VStack {
                Text(animal.name)
                    .font(.body)
                    .frame(alignment: .leading)
                Text(animal.habitat)
                    .font(.body)
                    .frame(alignment: .leading)
            }
        }
    }
}
