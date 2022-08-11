import UIKit

extension UIImage {
    
    static func getImage(named: String) -> UIImage {
        UIImage(systemName: named) ?? UIImage(named: named, in: Utils.currentBundle, with: nil) ?? UIImage()
    }
}
