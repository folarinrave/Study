//
//  ViewController.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/15/21.
//

import UIKit

class ViewController: UIViewController {

    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private lazy var errorAlert: UIAlertController = {
        let alert = UIAlertController(title: "Error", message: "Sub does not exist", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var data: [ChildrenData] = []
    @IBOutlet weak var searchBar: UISearchBar!
    var delegate: Coordinator!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(RedditCell.nib(), forCellReuseIdentifier: RedditCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
            spinner.showSpinner(view)
            ViewModel.fetch(subreddit: toSearch) { [weak self] response in
                DispatchQueue.main.async {
                    switch response {
                        case let .success(response):
                            self?.data = response
                            self?.tableView.reloadData()
                            self?.spinner.stopAnimating()
                        case .failure:
                            self?.present(self!.errorAlert, animated: true, completion: nil)
                        self?.spinner.stopAnimating()
                    }
                }
            }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

