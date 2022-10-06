import SwiftUI

extension View {
    
    public var mainViewFrame: CGRect {
        UIScreen.main.bounds
    }
    
    public func baseBackgroundView(_ backgroundColor: Color = Colors.baseBackgroundColor.color, content: () -> some View) -> some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            content()
        }
    }
    
    public func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
