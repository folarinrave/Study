//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by rave on 10/29/21.

import Foundation
import UIKit

class SearchViewModel {
    var movies: MovieModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    var movieImage = UIImage()
    var updateUI: (() -> Void)?
    var networkService = Network()
    var numRows: Int {
        movies?.results.count ?? 0
    }
    var selectedMovie = Movie()
    
    init() {
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }

    func fetchMovies( searchStr: String)
    {
        networkService.fetchMovies({ movies in
            // print("fetching movies")
            self.movies = movies
        }, searchStr: searchStr)
    }
  
    func getModel(row: Int) -> Movie? {
        movies?.results[row]
    }
    func getPoster(selectedMovie:Movie) -> UIImage
    {
        networkService.fetchPoster({ image in
            self.movieImage = image
        }, selectedMovie: selectedMovie)
     return movieImage
    }
}
