//
//  ViewController.swift
//  Example
//
//  Created by Jhonatan Pulgarin Arias on 11/08/22.
//

import UIKit
import StyleFramework

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.baseBackgroundColor.uiColor
        imageView.image = Images.loginHeaderIcon.uiImage
        
        imageView2.image = Images.email.uiImage
        imageView2.tintColor = Colors.baseTitle1ForegroundColor.uiColor
    }


}

