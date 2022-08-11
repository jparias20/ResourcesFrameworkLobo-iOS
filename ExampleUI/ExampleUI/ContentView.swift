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
            
            Colors.baseBackgroundColor
                .color.edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                Images.loginHeaderIcon.image
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Images.email.image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Colors.baseTitle1ForegroundColor.color)
                
                Images.password.image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
