//
//  Groups.swift
//  Grroups
//
//  Created by rave on 10/27/21.
//

import Foundation
let group = DispatchGroup()
let jokesURL = URL(string: "https://v2.jokeapi.dev/joke/Any?type=twopart")!
let drinksURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Rum")!
let musicURL = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/songs.json")!

  var jokesData = Data()
  var drinksData = Data()
  var musicData = Data()

func groups() {
    


    group.enter()
    
    print("starting Task One")
    let jokeTask = URLSession.shared.dataTask(with: jokesURL) { d, r, e in
        if d != nil
        {
            jokesData = d!
        }
        group.leave()
        print("finished Task One")

    }
    
    group.enter()
    print("starting Task Two")
    let drinkTask = URLSession.shared.dataTask(with: drinksURL) { d, r, e in
        if d != nil
        {
            drinksData = d!
        }
        group.leave()
        print("finished Task Two")

    }
    
    group.enter()
    print("starting Task three")
    let musicTask = URLSession.shared.dataTask(with: musicURL) { d, r, e in
        
        if d != nil
        {
            musicData = d!
        }
        group.leave()
        print("finished Task three")
    }
    
    jokeTask.resume()
    drinkTask.resume()
    musicTask.resume()
//        taskTwo.cancel()
//
    group.notify(queue: .main) {
        updateUI()
    }
}


func updateUI() {
    /// reload table view
    /// update labels
    print("update ui called")
    let jokeStr = String(decoding: jokesData, as: UTF8.self)
    let drinkStr = String(decoding: drinksData, as: UTF8.self)
    let musicStr = String(decoding: musicData, as: UTF8.self)

print( "JOKE: \(jokeStr)")
    print( "DRINKS: \(drinkStr)")
    print( "MUSIC: \(musicStr)")
}
