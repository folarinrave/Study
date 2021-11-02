//
//  ViewController.swift
//  AnimeProject
//
//  Created by Daniel Brannon on 10/29/21.
//

import UIKit

class AnimeViewController: UIViewController, UITableViewDelegate {
    var myData: AnimeModel? // saved
    var anime: [Anime] = []
    
    @IBOutlet weak var animeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingRequest().fetch() { response in
            
            DispatchQueue.main.async {
                self.myData = response
                self.anime = response.results
                self.animeTableView.reloadData()
            }
        }
        self.animeTableView.delegate = self
        self.animeTableView.dataSource = self
        let nib = UINib(nibName: "AnimeCell", bundle: nil)
        self.animeTableView.register(nib, forCellReuseIdentifier: "AnimeCell")
    }


}

extension AnimeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        anime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnimeCell.identifier) as? AnimeCell else { fatalError() }
        
        let animeItem = anime[indexPath.row]
        cell.synopsis.text = animeItem.synopsis
        cell.episodes.text = String(animeItem.episodes)
        cell.animeName.text = animeItem.title
        /// Check if cache has image, load from cache
        if let cachedImage = ImageCache.shared.read(imageStr: animeItem.image_url) {
            cell.coverArt.image = cachedImage
        /// If not, fetch image from API
        } else {
            /// 3. Start task for each cell
            let currentRunningTask = ImageCache.shared.startFetchRequest(imageStr: animeItem.image_url) { image in
                DispatchQueue.main.async {
                    cell.coverArt.image = image
                }
            }
            /// 4. Cancel that Task if
            /// - IF tasks is not done
            /// - IF cell is reused
            cell.onReuse = {
                /// cancel task here
                if let currentRunningTask = currentRunningTask {
                    ImageCache.shared.runningTasks[currentRunningTask]?.cancel()
                    ImageCache.shared.runningTasks.removeValue(forKey: currentRunningTask)
                }

            }
        }
        return cell
    }
}
