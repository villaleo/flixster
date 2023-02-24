//
//  Poster.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/23/23.
//

import Foundation

struct Poster: Decodable {
    let posterPath: String
}

struct PostersResponse: Decodable {
    let results: [Poster]
}
