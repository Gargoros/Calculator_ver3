
import SwiftUI

@main
struct Calculator_ver3App: App {
    var body: some Scene {
        
        @ObservedObject var mainViewModel = MainViewModel()
        
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
        }
    }
}
