//
//  ThirdVC.swift
//  coordinator_youtube
//
//  Created by rave on 10/16/21.
//

import UIKit

class ThirdVC: UIViewController, Coordinating{
    var coordinator: Coordinator?
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ThirdVCButtonClicked(_ sender: Any) {
        coordinator?.eventOccurred(with: .buttonTapped, identifierStr: "ThirdVC")
        
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
