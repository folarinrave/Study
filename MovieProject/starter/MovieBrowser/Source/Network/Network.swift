//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    
    // sample URL string
    //https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&language=en-US&page=1&include_adult=true
    
    
    func fetchMovies(_ completion: @escaping (MovieModel) -> Void, searchStr: String) {
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
//        let sites = try decoder.decode(SiteData.self, from: json)
        
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&include_adult=true&query=" + searchStr)
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, r, e in
                guard let data = data else { return }
                do {
                    let decoded = try decoder.decode(MovieModel.self, from: data)
                    completion(decoded)
                } catch {
                    print(" No movies fetched")
                }
            }.resume()
        }
    }
   func fetchPoster(_ completion: @escaping (UIImage)-> Void, selectedMovie:Movie)  {
        
       if (selectedMovie.posterPath != "placeholder" ){
           let url = URL(string: "https://image.tmdb.org/t/p/w500" + selectedMovie.posterPath!)
           if let url = url{
               URLSession.shared.dataTask(with: url) { data, _, _ in
                   guard let data = data else { return }

                   if let image = UIImage(data: data) {
                      print( "image completion")
                     completion(image)
                   }

                   
               }.resume()
               
            }
        }
        else
        {
            print("No Movie Poster")
        }

    }
    
}

