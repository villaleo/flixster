//
//  Movie.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import Foundation

struct Movie: Decodable {
    var originalTitle: String
    var overview: String
    var posterPath: String
    var backdropPath: String
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
}

enum MovieMediaSize: String {
    typealias RawValue = String
    
    case W500 = "w500/"
    case Original = "original/"
}

struct NowPlayingResponse: Decodable {
    let results: [Movie]
}

let mediaDomainURL: String = "https://image.tmdb.org/t/p/"
