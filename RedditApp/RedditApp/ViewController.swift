//
//  ViewController.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data: [ChildrenData] = []
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(RedditCell.nib(), forCellReuseIdentifier: RedditCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }


}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: RedditCell.identifier, for: indexPath) as! RedditCell
        customCell.configure(data: (s: self.data[indexPath.row].data.subreddit, t: self.data[indexPath.row].data.title, score: self.data[indexPath.row].data.score))
        return customCell
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let toSearch = searchBar.text {
            ViewModel.fetch(subreddit: toSearch) { [weak self] response in
                self?.data = response
                
                DispatchQueue.main.async { [self] in
                    self?.tableView.reloadData()
                }
            
            }
            searchBar.text = ""
        }
    }
}

