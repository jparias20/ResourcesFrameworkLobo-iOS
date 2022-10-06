//
//  ContentView.swift
//  ExampleUI
//
//  Created by Jhonatan Pulgarin Arias on 11/08/22.
//

import SwiftUI
import ResourcesFramework

struct ContentView: View {
    
    @State
    var informationView: InformationViewRenderMode? = nil
    
    var body: some View {
        baseBackgroundView {
            VStack(spacing: 20) {
                loadingButton
                errorButton
                requestNameModalButton
                
            }
        }
        .informationView(renderMode: $informationView)
    }
    
    @ViewBuilder
    var loadingButton: some View {
        Button {
            informationView = .loadingView
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                informationView = nil
            }
        } label: {
            Text("Show loading View")
        }
    }
    
    @ViewBuilder
    var errorButton: some View {
        Button {
            informationView = .errorView(.emailEmpty)

        } label: {
            Text("Show Error view")
        }
    }
    
    @ViewBuilder
    var requestNameModalButton: some View {
        Button {
            
            var requestedName: String = ""
            let form: RegularTextFieldView.Model = .init(placeHolder: .registerNameModalPlaceholder) {
                requestedName = $0
            }
            
            let model = AlertModalModel(
                title: .registerNameModalTitle,
                description: .registerNameModalDescription,
                forms: [form],
                primaryAction: .init(
                    title: .send,
                    theme: .accept,
                    callBack: {
                        print(requestedName)
                    }
                )
            )
            informationView = .alertModal(model)

        } label: {
            Text("Show request name")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(informationView: .errorView(.emailEmpty))
        
        ContentView(informationView: .loadingView)
        
        let model = AlertModalModel(
            title: .registerNameModalTitle,
            description: .registerNameModalDescription,
            forms: [
                .init(placeHolder: .registerNameModalPlaceholder, completion: { _ in }),
                .init(placeHolder: .registerNameModalPlaceholder, completion: { _ in }),
                .init(placeHolder: .registerNameModalPlaceholder, completion: { _ in }),
            ],
            primaryAction: .init(
                title: .send,
                theme: .accept,
                callBack: {}
            ),
            secondaryAction: .init(
                title: .close,
                theme: .reject,
                callBack: {}
            )
        )
        ContentView(informationView: .alertModal(model))
    }
}
