import UIKit
import SwiftUI

public enum Colors: String {
    
    case baseBackgroundColor
    case baseTextViewBackgroundColor
    
    case baseTitle1ForegroundColor
    case baseTitle2ForegroundColor
    
    case divideLineBackgroundColor
    
    case facebookButtonBackgroundColor
    case googleButtonBackgroundColor
    
    case modalBackgroundColor
    case modalShadowColor
    
    case rejectButtonBackgroundColor
    case rejectButtonForegroundColor
    
    case submitButtonBackgroundColor
    case submitButtonForegroundColor
    
    public var uiColor: UIColor {
        .getColor(named: rawValue)
    }
    
    public var color: Color {
        Color(.getColor(named: rawValue))
    }
}
