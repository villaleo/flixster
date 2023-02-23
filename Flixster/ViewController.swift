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
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=" + movieAPIKey)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            if let error = error {
                fatalError("Network error: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let response = try decoder.decode(NowPlayingResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.movies = response.results
                    self?.movieTView.reloadData()
                }
            } catch {
                fatalError("Parse error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
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
        let cell = movieTView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTVCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}
