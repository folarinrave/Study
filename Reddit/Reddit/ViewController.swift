//
//  ViewController.swift
//  HaHaHa
//
//  Created by Folarin Williamson on 10/14/21.
//

import UIKit

// MVVM -
// M = RESPONSE
// VM = VIEWMODEL
// V = VIEW

// viewcontroller should only manage its views
// view + subview



class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate{
    //holds the kind variable in Response.swift
    var kind = Int()
    //holds the children data from JSON file
    var childArray = [Response.Data.Children].self()
    var subreddit = String()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var subredditLabel: UILabel!
   
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private lazy var errorAlert: UIAlertController = {
       let alert = UIAlertController(title: "Error!",
                                     message: "Something's wrong in ViewControl.",
                                     preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "customCell", bundle: .main), forCellReuseIdentifier: "customCell")
        searchBar.delegate = self
       }
 
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        //cell.layoutIfNeeded
        cell.scoreTextView.text = "Score: " + String(childArray[indexPath.row].data.score)
        cell.titleTextLabel.text = "Title: " +  childArray[indexPath.row].data.title
       // cell.titleTextLabel.sizeToFit()
        cell.sizeToFit()
        return cell
    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.orange
//
//        let label = UILabel()
//        label.text = "subreddit"
//        label.font = label.font.withSize(20)
//        label.frame = CGRect(x:5, y: 5, width: 140, height: 240)
//        view.addSubview(label)
//
//        return view
//        }
//    //above won't show without this
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
    
        
       if (searchBar.text != nil)
        {
           subreddit = searchBar.text ?? ""
           subredditLabel.text = "Subreddit: " + subreddit
           let URLStr = "https://reddit.com/r/" + subreddit + "/.json"
           
           spinner.showSpinner(view)
           searchBar.isHidden = true
           callTheDamnAPI(URLStr: URLStr)
        }
        
    }
    

    /// Call's Reddit API
    /// command + shift + A (bring up menu)
    private func callTheDamnAPI(URLStr:String) {
        ViewModel.fetch ( { result in

            self.kind = result.data.dist
            self.childArray = result.data.children

            DispatchQueue.main.async {
//
//                switch result {
//                case let .success(response):
//                    self.subredditLabel.text = response.kind
//                case .failure:
//                    self.present(self.errorAlert, animated: true, completion: nil)
//                }

                self.spinner.stopAnimating()
                self.tableView.reloadData()
                self.searchBar.isHidden = false
            }
        }, searchURL: URLStr)



    }
    
    
}
