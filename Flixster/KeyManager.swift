//
//  KeyManager.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import Foundation

class KeyManager {
    static let shared = KeyManager()
    var map: NSDictionary
    private let fileName: String = "Secrets"
    private let fileExtension: String = "plist"
    
    private init() {
        if let path = Bundle.main.path(forResource: self.fileName, ofType: self.fileExtension) {
            self.map = .init(contentsOfFile: path)!
        } else {
            let file = "\(fileName).\(fileExtension)"
            fatalError("Could not find '\(file)'. This file is needed for the MovieDB API key.")
        }
    }
}
