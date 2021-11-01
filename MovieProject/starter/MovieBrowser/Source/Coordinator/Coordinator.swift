//
//  Coordinator.swift
//  MovieBrowser


import UIKit

// your cooridinator is going to be the delegate of your viewcontrollers

class Coordinator{
    let navigationController: UINavigationController
    
    init(_ rootController: UIViewController) {
        self.navigationController = UINavigationController(rootViewController: rootController)
    }
}

extension Coordinator: SearchViewControllerDelegate {
    func done(selectedMovie:Movie) {
        let viewModel = SearchViewModel()
        let vc = UIStoryboard(name: "MovieDetailViewController", bundle: .main).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        vc.selectedMovie = selectedMovie
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, y"
        DispatchQueue.main.async {
            vc.movieTitleLabel.text = selectedMovie.title
            vc.movieOverviewLabel.text = selectedMovie.overview
            vc.movieDateLabel.text =  dateFormatter.string (from:selectedMovie.releaseDate)
            vc.image = viewModel.getPoster(selectedMovie: selectedMovie)
        }
        
       
        navigationController.pushViewController(vc, animated: true)
        
    }
}

