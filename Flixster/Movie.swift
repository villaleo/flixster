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
    
    case W500 = "w500/"
    case Original = "original/"
}

let mediaDomainURL: String = "https://image.tmdb.org/t/p/"
// Media URL => mediaDomainURL + MovieMediaSize + poserPath
extension Movie {
    // MARK: Mock data
    static var mockData: [Movie] = [
        .init(
            title: "Black Panther: Wakanda Forever",
            overview: "Queen Ramonda, Shuri, M'Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T'Challa's death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
            posterPath: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
            backdropPath: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
            voteAverage: 7.5,
            voteCount: 3036,
            popularity: 6117.07
        ),
        .init(
            title: "Puss in Boots: The Last Wish",
            overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
            posterPath: "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
            backdropPath: "/tGwO4xcBjhXC0p5qlkw37TrH6S6.jpg",
            voteAverage: 8.5,
            voteCount: 3626,
            popularity: 3560.972
        ),
        .init(
            title: "M3GAN",
            overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
            posterPath: "/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg",
            backdropPath: "/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg",
            voteAverage: 7.5,
            voteCount: 1530,
            popularity: 1998.608
        ),
        .init(
            title: "Avatar: The Way of Water",
            overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
            posterPath: "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
            backdropPath: "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg",
            voteAverage: 7.7,
            voteCount: 5240,
            popularity: 1601.327
        ),
        .init(
            title: "The Whale",
            overview: "A reclusive English teacher suffering from severe obesity attempts to reconnect with his estranged teenage daughter for one last chance at redemption.",
            posterPath: "/ken2sQbCqZuAYmgPknrChXvkrEK.jpg",
            backdropPath: "/kc4Tuc0aONtPOqOs0PAPQGmJren.jpg",
            voteAverage: 7.5,
            voteCount: 111,
            popularity: 717.656
        )
    ]
}
