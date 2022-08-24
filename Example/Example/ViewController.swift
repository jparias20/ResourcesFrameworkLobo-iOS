//
//  ViewController.swift
//  Example
//
//  Created by Jhonatan Pulgarin Arias on 11/08/22.
//

import UIKit
import ResourcesFramework

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.baseBackgroundColor.uiColor
        imageView.image = Images.loginHeaderIcon.uiImage
        
        imageView2.image = Images.email.uiImage
        imageView2.tintColor = Colors.baseTitle1ForegroundColor.uiColor
        
        print(LanguageString.emailPlaceholder.localized)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let loadingView = UILoadingView.show(in: self.view)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                DispatchQueue.main.async {
                    loadingView.remove()
                }
            }
        }
        
        
    }


}

