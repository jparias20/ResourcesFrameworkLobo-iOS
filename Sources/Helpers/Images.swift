import UIKit
import SwiftUI

public enum Images: String {
    
    case email = "person.circle"
    case password = "lock"
    case visible = "eye"
    case invisible = "eye.slash"
    
    case loginHeaderIcon
    
    public var uiImage: UIImage {
        UIImage(systemName: rawValue) ?? UIImage(named: rawValue, in: Utils.currentBundle, with: nil) ?? UIImage()
    }
    
    public var image: Image {
        UIImage.getImage(named: rawValue) == nil ? Image(systemName: rawValue) : Image(rawValue, bundle: Utils.currentBundle)
    }
}
