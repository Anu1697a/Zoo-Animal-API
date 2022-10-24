import SwiftUI

struct OptionSelectorView: View {
    let optionArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    @Binding var selection: String
    @Binding var showSheet: Bool
    
    var body: some View {
        List(optionArray, id: \.self) { option in
            ZStack {
                Color.yellow
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                Text(option)
                    .font(.largeTitle)
            }
            .onTapGesture {
                selection = option
                showSheet = false
            }
            
        }
    }
}
