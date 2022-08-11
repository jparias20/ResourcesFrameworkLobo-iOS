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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.splashBackgroundColor.uiColor
        imageView.image = Images.loginHeaderIcon.uiImage
    }


}

