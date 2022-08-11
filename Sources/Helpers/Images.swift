import UIKit
import SwiftUI

public enum Images: String {
    
    case email = "person.circle"
    case password = "lock"
    case visible = "eye"
    case invisible = "eye.slash"
    
    case loginHeaderIcon
    
    public var uiImage: UIImage {
        UIImage.getImage(named: rawValue)
    }
    
    public var image: Image {
        Image(uiImage: .getImage(named: rawValue))
    }
}
