//
//  KeyManager.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import Foundation

class KeyManager {
    static let shared = KeyManager()
    
    private let fileName: String = "Secrets"
    private let fileExtension: String = "plist"
    private var keyNameInPListFile: String = "Key"
    private var map: NSDictionary
    
    private init() {
        if let path = Bundle.main.path(forResource: self.fileName, ofType: self.fileExtension) {
            self.map = .init(contentsOfFile: path)!
        } else {
            let file = "\(fileName).\(fileExtension)"
            fatalError("Could not find '\(file)'. This file is needed for the MovieDB API key.")
        }
    }
    
    /// Returns the API key for the MovieDB.org
    /// If key is not found, an empty String will be returned.
    func getMovieAPIKey() -> String {
        guard let key = map[keyNameInPListFile] as? String else { return "" }
        return key
    }
}
