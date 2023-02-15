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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with movie: Movie) {
        self.movieTitleLabel.text = movie.title
        self.movieOverviewLabel.text = movie.overview
        let url = mediaDomainURL + MovieMediaSize.W500.rawValue + movie.posterPath
        if let url: URL = .init(string: url) {
            let pipeline: ImagePipeline = .init()
            _ = pipeline.loadImage(with: url, completion: { result in
                self.moviePosterIView.image = try! result.get().image
            })
        } else {
            fatalError("Could not fetch the image at \(url)")
        }
    }
}
