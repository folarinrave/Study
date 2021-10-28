//
//  ViewController.swift
//  week03assessment
//
//  Created by Luat on 10/18/21.
//

import UIKit

protocol HomeViewControllerDelegate {
    func goToJokes()
    func goToDrinks()
}
class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate!

//    @IBAction func jokesButton(_ sender: UIButton) {
//        print("joke button pressed")
//        delegate?.goToJokes()
//    }
    @IBAction func drinksButton(_ sender: UIButton) {
        print("drink button pressed")
        delegate?.goToDrinks()
    }
    @IBAction func jokesButton(_ sender: UIButton) {
        print("joke button pressed")
        delegate?.goToJokes()

    }
    /// Show "setup" and "delivery" fields
    let jokesAddress = "https://v2.jokeapi.dev/joke/Any?type=twopart"
    
    /// Show drink name, drink imageUrl, and drink ID
    let drinksAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Rum"
    
    /// Fetch music if you are done early. Show song and artist name
    let musicAddress = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/songs.json"

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    let group = DispatchGroup()
   
    func fetchAllAPI() {
        
        group.enter()
        group.enter()
        
        print("starting joke fetching")
        let fetchJoke = URLSession.shared.dataTask(with:URL(string:jokesAddress)! ) { d, r, e in
            let DecodedJokeData = String(decoding: d!, as: UTF8.self)
            self.group.leave()
            print("joke data here", DecodedJokeData)

        }
        

        print("starting drink fetching")
        let fetchDrink = URLSession.shared.dataTask(with:URL(string:drinksAddress)! ) { d, r, e in
            let DecodedDrinkData = String(decoding: d!, as: UTF8.self)
            self.group.leave()
            print("drink data here",  DecodedDrinkData )

        }
        
        group.enter()
        print("starting music fetching")
        let fetchMusic = URLSession.shared.dataTask(with: URL(string:musicAddress)!) { d, r, e in
            let DecodedMusicData = String(decoding: d!, as: UTF8.self)
            self.group.leave()
            print("music data here", DecodedMusicData)
        }
        
        fetchJoke.resume()
        fetchDrink.resume()
        fetchMusic.resume()

        group.notify(queue: .main) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        /// reload table view
        /// update labels
        print("update ui called")
       
        

    }
    
    @IBAction func fetchAPI(_ sender: UIButton) {
        fetchAllAPI()
    }
    
    
}
