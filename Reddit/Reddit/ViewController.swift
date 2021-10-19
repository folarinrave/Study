//
//  ViewController.swift
//  Reddit
//
//  Created by Daniel Brannon on 10/17/21.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    var subReddit: String = "nfl"
    var myData: [Children] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel.fetch(subReddit: subReddit) { response in
            
            DispatchQueue.main.async {
                self.myData = response.data.children
                self.tableView.reloadData()
                self.title = "Reddit"
                let nib = UINib(nibName: "myCell", bundle: nil)
                self.tableView.register(nib, forCellReuseIdentifier: "myCell")
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell
        cell.setSubreddit(data: myData[indexPath.row].data.subreddit)
        cell.setTitle(data: myData[indexPath.row].data.title)
        cell.setScore(data: myData[indexPath.row].data.score)
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        subReddit = searchBar.text ?? "nfl"
        ViewModel.fetch(subReddit: subReddit) { response in
            
            DispatchQueue.main.async {
                self.myData = response.data.children
                self.tableView.reloadData()
    }
    }
    }
}
