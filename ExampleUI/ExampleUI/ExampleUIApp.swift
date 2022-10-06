//
//  ExampleUIApp.swift
//  ExampleUI
//
//  Created by Jhonatan Pulgarin Arias on 11/08/22.
//

import SwiftUI

@main
struct ExampleUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(informationView: .constant(.loadingView))
        }
    }
}
