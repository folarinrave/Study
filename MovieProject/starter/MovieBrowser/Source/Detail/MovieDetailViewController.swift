//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var viewModel = SearchViewModel()
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
   
    var selectedMovie = Movie()
   var image = UIImage()
    override func viewDidLoad() {
    
       movieImageView.image = UIImage(named: "placeholder")
    
        if let url = URL(string: "https://image.tmdb.org/t/p/w500" + selectedMovie.posterPath!) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                }
            }.resume()
        }
        
        self.navigationController?.navigationBar.tintColor = .blue

    }
    override func viewDidAppear(_ animated: Bool) {
        view.reloadInputViews()
    }
    
}
