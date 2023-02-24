//
//  ViewController.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var movieTView: UITableView!
    var movies: [Movie] = []
    let movieAPIKey: String = KeyManager.shared.getMovieAPIKey()
    
    // MARK: Overrides    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=" + movieAPIKey
        try! decodeAPIResponseAndHandleResponse(with: URL(string: url)!) { [weak self] (response: NowPlayingResponse) in
                self?.movies = response.results
                self?.movieTView.reloadData()
        }
        self.movieTView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
            let index = movieTView.indexPath(for: cell),
            let details = segue.destination as? MovieDetailsVController
        {
            let movie = movies[index.row]
            details.movie = movie
        }
    }
}

// MARK: Conform to UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
            as! MovieTVCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}
