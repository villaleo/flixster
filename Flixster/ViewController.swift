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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTVCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movies = Movie.mockData
        self.movieTView.dataSource = self
    }
}
