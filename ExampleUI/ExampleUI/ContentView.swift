//
//  ContentView.swift
//  ExampleUI
//
//  Created by Jhonatan Pulgarin Arias on 11/08/22.
//

import SwiftUI
import StyleFramework

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Colors.splashBackgroundColor
                .color.edgesIgnoringSafeArea(.all)
            
            Images.loginHeaderIcon.image
                .resizable()
                .frame(width: 100, height: 100)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
