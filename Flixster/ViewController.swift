//
//  ViewController.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/14/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var movieTView: UITableView!
    var movies: [Movie] = []
    let movieAPIKey: String? = nil
    
    // MARK: Conform to UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTVCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    // MARK: Overrides    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movies = Movie.mockData
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
