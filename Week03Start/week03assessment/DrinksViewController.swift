//
//  DrinksViewController.swift
//  week03assessment
//
//  Created by Limei  Chen on 10/18/21.
//

import UIKit


class DrinksViewController: UIViewController {
   
    
    let tableView = UITableView()
    
    
//    var data: DrinkModel?
    var data: [Drink] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(myNib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        tableView.backgroundColor = .systemPink
        
        DrinksViewModel.fetchDrinks { data in
            self.data = data.drinks
            DispatchQueue.main.async{
                self.tableView.reloadData()
                print("This is Drinks data" , data.drinks)
            }
            
        }
    }

}

extension DrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        
        cell?.textLabel?.numberOfLines = 0
        let finalData = data[indexPath.row]
        cell?.strDrink.text = finalData.strDrink
        cell?.strDrinkThumb.text = finalData.strDrinkThumb
        cell?.idDrink.text = finalData.idDrink

        return cell!
    }
}
