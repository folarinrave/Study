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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        ViewModel.fetch (input:searchBar.text!){ response in
           
            self.data = response
            DispatchQueue.main.async {
                self.tableView.reloadData()
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

extension ViewController: UITableViewDelegate {
    
}

