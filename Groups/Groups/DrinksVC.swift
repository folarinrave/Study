//
//  Drinks.swift
//  week03assessment
//
//  Created by rave on 10/18/21.
//

import UIKit

class DrinksVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (" COUNT \(drinksArray.count)")
       return drinksArray.count
    }
    

    var DrinksDelegate: DrinksDelegate?
    var drinksArray = [DrinkChild]()
    @IBOutlet weak var tableView: UITableView!
    private lazy var errorAlert: UIAlertController = {
       let alert = UIAlertController(title: "Error!",
                                     message: "Something's wrong in DrinksVC.",
                                     preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        return alert
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
      
        DrinksViewModel.fetchDrinks { result in

          //  print("RESULT: \(result)")


            DispatchQueue.main.async {

                switch result {
                case let .success(response):
                    
                    self.drinksArray = response.drinks
                case .failure:
                    self.present(self.errorAlert, animated: true, completion: nil)
                }

            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DrinkCell", bundle: .main), forCellReuseIdentifier: "DrinkCell")
        tableView.rowHeight = 170
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell") as! DrinkCell
        cell.layoutIfNeeded()
        cell.drinkNameLabel.text = drinksArray[indexPath.row].strDrink
        cell.drinkURLLabel.text = drinksArray[indexPath.row].strDrinkThumb
        cell.drinkIDLabel.text = String( drinksArray[indexPath.row].idDrink)
        return cell
        
    }
    
    
  
}
