//
//  ViewController.swift
//  Reddit
//
//  Created by Limei  Chen on 10/14/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
//    spinner
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
//    Error
    private lazy var errorAlert: UIAlertController = {
       let alert = UIAlertController(title: "Error!",
                                     message: "Page cannot be loaded",
                                     preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        return alert
    }()
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        spinner.showIn(view)
//        ViewModel.fetch (input:searchBar.text!){ response in
//            self.data = response
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//
//        }
        ViewModel.fetch (input:searchBar.text!) {result in
        
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    self.data = response
                    self.tableView.reloadData()
                case .failure:
                    self.present(self.errorAlert, animated: true, completion: nil)
                }
                self.spinner.stopAnimating()
            }
        }
    }
    
    var data: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Reddit"
        
        
        searchBar.delegate = self
        
        let myNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(myNib, forCellReuseIdentifier: "MyCell")
        
//        data fetched
//        ViewModel.fetch (input:"nfl"){ response in
//            self.data = response
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//
//        }
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data {
           return data.data.children.count
           
        } else {
            return 0
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomTableViewCell
        let nestedData = data?.data.children[indexPath.row].data
        cell.subredditLabel.text = "Subreddit: \(nestedData?.subreddit ?? "")"
        cell.titleLabel.text = "Title: \(nestedData?.title ?? "")"
        cell.scoreLabel.text = "Score:\(String(nestedData?.score ?? 0))"
        return cell
        
    }
}

extension UIActivityIndicatorView {
    func showIn(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startAnimating()
    }
}

