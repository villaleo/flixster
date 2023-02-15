//
//  Movie.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import Foundation

struct Movie {
    var title: String
    var overview: String
    var posterPath: String
    var backdropPath: String
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
}

enum MovieMediaSize: String {
    typealias RawValue = String
    
    case W500 = "w500"
    case Original = "original"
}

private let mediaDomainURL: String = "https://image.tmdb.org/t/p/"
// Media URL => mediaDomainURL/MovieMediaSize/poserPath
extension Movie {
    // MARK: Mock data
    static var mockData: [Movie] = [
        // TODO: Populate me...
    ]
}
