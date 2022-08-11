import UIKit
import SwiftUI

public enum Colors: String {
    
    case loginBackgroundColor
    case loginEmailButtonBackgroundColor
    case loginEmailButtonForegroundColor
    case loginFooterLabelForegroundColor
    case loginTextFieldBackgroundColor
    case loginTextFieldBorderColor
    case loginTextFieldForegroundColor
    
    case splashBackgroundColor
    
    public var uiColor: UIColor {
        .getColor(named: rawValue)
    }
    
    public var color: Color {
        Color(.getColor(named: rawValue))
    }
}
