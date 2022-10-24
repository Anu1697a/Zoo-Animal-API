import SwiftUI

enum Height: String {
    case Feet = "Feet"
    case Centimetres = "Centimetres"
    case Metres = "Metres"
}

enum Weight: String {
    case Pounds =  "Pounds"
    case Kilograms = "Kilograms"
    case Stones = "Stones"
}

struct SettingsView: View {
    
    @AppStorage("height") var storedHeight: Height = .Feet
    @AppStorage("weight") var storedWeight: Weight = .Pounds
    
    @State private var height: Height = .Feet
    @State private var weight: Weight = .Pounds
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                DisclosureGroup("Height choices") {
                    Button(Height.Feet.rawValue) {
                        height = Height.Feet
                    }.font(.title)
                    Button(Height.Centimetres.rawValue) {
                        height = Height.Centimetres
                    }.font(.title)
                    Button(Height.Metres.rawValue) {
                        height = Height.Metres
                    }.font(.title)
                }
                DisclosureGroup("Weight choices") {
                    Button(Weight.Pounds.rawValue) {
                        weight = Weight.Pounds
                    }.font(.title)
                    Button(Weight.Kilograms.rawValue) {
                        weight = Weight.Kilograms
                    }.font(.title)
                    Button(Weight.Stones.rawValue) {
                        weight = Weight.Stones
                    }.font(.title)
                }
                Spacer()
                Button("Save") {
                    storedHeight = height
                    storedWeight = weight
                }.font(.title)
                    .buttonStyle(.bordered)
                Spacer()
                
            }.navigationTitle("Settings")
                .padding()
        }
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
