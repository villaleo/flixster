//
//  MovieDetailsVController.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import UIKit
import Nuke

class MovieDetailsVController: UIViewController {
    @IBOutlet weak var movieBackdropIView: UIImageView!
    @IBOutlet weak var movieVoteAverageLabel: UILabel!
    @IBOutlet weak var movieVotesLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = movie.title
        let url = mediaDomainURL + MovieMediaSize.W500.rawValue + movie.backdropPath
        if let url: URL = .init(string: url) {
            let pipeline: ImagePipeline = .init()
            _ = pipeline.loadImage(with: url, completion: { result in
                self.movieBackdropIView.image = try! result.get().image
            })
        } else {
            fatalError("Could not fetch the image at \(url)")
        }
        self.movieVoteAverageLabel.text = String(movie.voteAverage)
        self.movieVotesLabel.text = String(movie.voteCount)
        self.moviePopularityLabel.text = String(movie.popularity)
    }
}
