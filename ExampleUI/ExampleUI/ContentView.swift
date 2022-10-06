//
//  ContentView.swift
//  ExampleUI
//
//  Created by Jhonatan Pulgarin Arias on 11/08/22.
//

import SwiftUI
import ResourcesFramework

struct ContentView: View {
    
    @Binding
    var informationView: InformationViewRenderMode?
    
    var body: some View {
        ZStack {
            
            Colors.baseBackgroundColor
                .color.edgesIgnoringSafeArea(.all)
            LoadingView()
        }
        .informationView(renderMode: $informationView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(informationView: .constant(.errorView(.emailEmpty)))
        
        ContentView(informationView: .constant(.loadingView))
        
        let model = AlertModalModel(
            title: .registerNameModalTitle,
            description: .registerNameModalDescription,
            forms: [
                .init(placeHolder: .registerNameModalPlaceholder, inputText: .constant("")),
                .init(placeHolder: .registerNameModalPlaceholder, inputText: .constant("")),
                .init(placeHolder: .registerNameModalPlaceholder, inputText: .constant(""))
            ],
            primaryAction: .init(
                title: .send,
                callBack: {},
                theme: .accept
            ),
            secondaryAction: .init(
                title: .close,
                callBack: {},
                theme: .reject
            )
        )
        ContentView(informationView: .constant(.alertModal(model)))
    }
}
