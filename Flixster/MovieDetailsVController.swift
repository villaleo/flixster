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
        self.movieVoteAverageLabel.text = String(movie.voteAverage)
        self.movieVotesLabel.text = String(movie.voteCount)
        self.moviePopularityLabel.text = String(movie.popularity)
        
        let url = mediaDomainURL + MovieMediaSize.W500.rawValue + movie.backdropPath
        ImagePipeline.fetchImage(from: url, into: &self.movieBackdropIView)
    }
}
