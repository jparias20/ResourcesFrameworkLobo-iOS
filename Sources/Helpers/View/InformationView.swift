import SwiftUI

public enum InformationViewRenderMode {
    case loadingView
    case errorView(ErrorType)
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

struct ShakeEffect: GeometryEffect {
    func effectValue(size: CGSize) -> ProjectionTransform {
        print(position)
        return ProjectionTransform(CGAffineTransform(translationX: position, y: 0))
    }
    
    var position: CGFloat
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }
}
