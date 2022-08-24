import SwiftUI
import dotLottie

public struct LoadingView: View {
    
    public init() { }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            Loading()
        }
        .background {
            VisualEffectView(effect: UIBlurEffect(style: .dark))
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    @ViewBuilder
    func Loading() -> some View {
        if let url = URL(string: Constans.regularLottieURLString) {
            
            DotLottieView(url: url, autoPlay: true, loopMode: .loop, play: .constant(1))
                .frame(height: 250)
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LoadingView()
        }
    }
}

