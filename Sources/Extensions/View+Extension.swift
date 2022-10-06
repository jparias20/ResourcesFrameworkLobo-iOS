import SwiftUI

extension View {
    
    public var mainViewFrame: CGRect {
        UIScreen.main.bounds
    }
    
    public func informationView(renderMode: Binding<InformationViewRenderMode?>) -> some View {
        modifier(InformationView(renderMode: renderMode))
    }
}
