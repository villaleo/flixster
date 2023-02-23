//
//  MovieTVCell.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import UIKit
import Nuke

class MovieTVCell: UITableViewCell {
    @IBOutlet weak var moviePosterIView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    func configure(with movie: Movie) {
        self.movieTitleLabel.text = movie.originalTitle
        self.movieOverviewLabel.text = movie.overview
        
        let url = mediaDomainURL + MovieMediaSize.W500.rawValue + movie.posterPath
        ImagePipeline.fetchImage(from: url, into: &self.moviePosterIView)
    }
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
