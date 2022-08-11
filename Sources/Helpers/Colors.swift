import UIKit
import SwiftUI

public enum Colors: String {
    
    case baseBackgroundColor
    case baseButtonSubmitBackgroundColor
    case baseTextViewBackgroundColor
    case baseTitle1ForegroundColor
    case baseTitle2ForegroundColor
    
    case facebookButtonBackgroundColor
    case googleButtonBackgroundColor
        
    public var uiColor: UIColor {
        .getColor(named: rawValue)
    }
    
    public var color: Color {
        Color(.getColor(named: rawValue))
    }
}
