import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            EdicaoView(edicaoModel:EdicaoModel())
        }
    }
}
