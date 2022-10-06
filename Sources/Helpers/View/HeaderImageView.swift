import SwiftUI

public struct HeaderImageView: View {
    
    public let icon: Images
    
    public var body: some View {
        icon.image
            .resizable()
            .frame(width: 100, height: 100)
            .padding(.top, 30)
    }
}

struct HeaderImageView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImageView(icon: .loginHeaderIcon)
    }
}
