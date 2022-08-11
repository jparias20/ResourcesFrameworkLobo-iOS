import UIKit

extension UIColor {
    
    static func getColor(named: String) -> UIColor {
        UIColor(named: named, in: Utils.currentBundle, compatibleWith: nil) ?? .white
    }
}
