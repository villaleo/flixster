//
//  ViewController.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import UIKit

class ViewController: UIViewController {
    let movieAPIKey: String? = KeyManager.instance.map["movieAPI"] as? String
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
