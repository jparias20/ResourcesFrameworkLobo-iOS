import UIKit

extension UIImage {
    
    static func getImage(named: String) -> UIImage? {
        UIImage(named: named, in: Utils.currentBundle, with: nil)
    }
}
