//
//  PostersViewController.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/23/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController {
    @IBOutlet weak var postersCollectionView: UICollectionView!
    var posters: [Movie] = []
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let key = KeyManager.shared.getMovieAPIKey()
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=" + key
        try! decodeAPIResponseAndHandleResponse(with: URL(string: url)!) {
            [weak self] (response: NowPlayingResponse) in
                self?.posters = response.results
                self?.postersCollectionView.reloadData()
        }
        
        self.postersCollectionView.dataSource = self
        self.updateCollectionViewLayout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let index = postersCollectionView.indexPath(for: cell),
            let details = segue.destination as? MovieDetailsVController
        {
            let poster = posters[index.row]
            details.movie = poster
        }
    }
    
    // MARK: Private helpers
    private func updateCollectionViewLayout() {
        let layout = postersCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        let numberOfColumns: CGFloat = 3
        let width = (
            postersCollectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)
        ) / numberOfColumns
        layout.itemSize = CGSize(width: width, height: width)
    }
}

// MARK: Conform PostersViewController to UICollectionViewDataSource
extension PostersViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return posters.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PosterCollectionViewCell.identifier,
            for: indexPath
        ) as! PosterCollectionViewCell
        let poster = posters[indexPath.item]
        let imageURL = mediaDomainURL + MovieMediaSize.W500.rawValue + poster.posterPath
        ImagePipeline.fetchImage(from: imageURL, into: &cell.posterImageView)
        return cell
    }
}
