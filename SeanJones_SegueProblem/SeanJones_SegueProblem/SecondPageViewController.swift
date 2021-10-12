//
//  SecondPageViewController.swift
//  SeanJones_SegueProblem
//
//  Created by Sean Jones on 10/12/21.
//

import UIKit

class SecondPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    //MARK: - PROPERTIES
    
    var textInputs = [String]()
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var inputsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inputsTableView.delegate = self
        inputsTableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(textInputs.count)
        return textInputs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath)
        
        cell.textLabel?.text = textInputs[indexPath.row]
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondPageViewController: TextInputsDelegate {
    func addInput(input: String) {
        self.textInputs.append(input)
    }
    
    
}
