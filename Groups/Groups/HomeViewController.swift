//
//  ViewController.swift
//  week03assessment
//
//  Created by Luat on 10/18/21.
//

import UIKit


protocol DrinksDelegate {
    func DrinksDone()
}


protocol JokesDelegate {
    func JokesDone()
}


class HomeViewController: UIViewController {
    
    var JokesDelegate: JokesDelegate?
    var  DrinksDelegate:  DrinksDelegate?

    /// Show "setup" and "delivery" fields
    let jokesAddress = "https://v2.jokeapi.dev/joke/Any?type=twopart"
    
    /// Show drink name, drink imageUrl, and drink ID
    let drinksAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Rum"
    
    /// Fetch music if you are done early. Show song and artist name
    let musicAddress = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/songs.json"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func JokesVCButtonClicked(_ sender: Any) {
       // print("Jokes button clicked")
        
        JokesDelegate?.JokesDone()
    }
    
    @IBAction func DrinksVCButtonClicked(_ sender: Any) {
    
       // print("drinks button pushed")
        DrinksDelegate?.DrinksDone()
    }
    
    
    @IBAction func FetchAllAPIButton(_ sender: UIButton) {
        
        groups()
        
        
    }
   
    
}
