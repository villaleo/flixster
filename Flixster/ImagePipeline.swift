//
//  ImagePipeline.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/15/23.
//

import Foundation
import UIKit
import Nuke

extension ImagePipeline {
    /// Attempts to load the image resource from the URL into the UIImageView.
    static func fetchImage(from url: String, into imageView: inout UIImageView) {
        if let url = URL(string: url) {
            Nuke.ImagePipeline().loadImage(with: url, completion: { [imageView] result in
                imageView.image = try! result.get().image
            })
        } else {
            fatalError("Could not fetch the image at \(url)")
        }
    }
}
