//
//  ViewController.swift
//  MockImageCacheProject
//
//  Created by Daniel Brannon on 10/25/21.
//

import UIKit

protocol ViewControllerDelegate {
    func fetchData(url: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var myData: [DrinkItem] = []
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        NetworkingRequest.fetch() { response in
            
            DispatchQueue.main.async {
                self.myData = response.drinks
                let nib = UINib(nibName: "DrinkCell", bundle: nil)
                self.tableView.register(nib, forCellReuseIdentifier: "DrinkCell")
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell") as? DrinkCell else {
            return UITableViewCell()
        }
        cell.setName(string: myData[indexPath.row].drinkName)
        cell.setId(string: myData[indexPath.row].drinkId)
        return cell
    }
    
    
}
