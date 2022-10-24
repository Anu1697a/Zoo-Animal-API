import SwiftUI

@main
struct ZooDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            AnimalView()
                .tabItem {
                    Label("Animal", systemImage: "hare")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "info.circle.fill")
                }
        }
    }
}
