import SwiftUI

public enum InformationViewRenderMode {
    case loadingView
    case errorView(ErrorType)
    case alertModal(AlertModalModel)
}

extension View {
    
    public func informationView(renderMode: Binding<InformationViewRenderMode?>) -> some View {
        modifier(InformationView(renderMode: renderMode))
    }
}

struct InformationView: ViewModifier {
    
    @Binding
    var renderMode: InformationViewRenderMode?
    
    func body(content: Content) -> some View {
        if let renderMode = renderMode {
            switch renderMode {
            case .loadingView:
                LoadingView()
            case .errorView(let error):
                showErroView(content: content, with: error)
                
            case .alertModal(let model):
                AlertModalView(model: model)
            }
        } else {
            content
        }
    }
}

private extension InformationView {
    
    @ViewBuilder
    func showErroView(content: Content, with error: ErrorType) -> some View {
        ZStack {
            content
                .overlay {
                    ErrorView(error: error) {
                        renderMode = nil
                    }
                }
        }
    }
}
