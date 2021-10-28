//
//  ViewController.swift
//  Programatically
//
//  Created by Limei  Chen on 10/18/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let searchBar = UISearchBar()
//    let myTableView: UITableView
    let myTableView = UITableView()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo:searchBar.bottomAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
       
      
    }

    func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo:view.topAnchor, constant: 30).isActive = true
        searchBar.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Olivia Chen"
        return cell
    }
}
