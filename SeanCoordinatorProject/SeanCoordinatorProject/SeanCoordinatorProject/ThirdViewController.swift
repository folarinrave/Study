//
//  ThirdViewController.swift
//  SeanCoordinatorProject
//
//  Created by Sean Jones on 10/14/21.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - PROPERTIES
    
    var firstWord: String?
    var secondWord: String?
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var firstWordLabel: UILabel!
    @IBOutlet weak var secondWordLabel: UILabel!
    
    
    
//MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        
        

        // Do any additional setup after loading the view.
    }
    
    static func create() -> ViewController {
        let controller = UIStoryboard(name: "Third", bundle: .main).instantiateViewController(withIdentifier: "ThirdVC") as! ViewController
        return controller
    }
    
    func setLabelText() {
        if let first = firstWord {
            firstWordLabel.text = first
        }
        
        if let second = secondWord {
            secondWordLabel.text = second
        }
        
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
