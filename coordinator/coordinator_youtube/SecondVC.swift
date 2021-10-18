//
//  SecondVC.swift
//  coordinator_youtube
//
//  Created by rave on 10/16/21.
//

import UIKit

class SecondVC: UIViewController, Coordinating
{
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SecondVCButtonClicked(_ sender: Any) {
        coordinator?.eventOccurred(with: .buttonTapped, identifierStr: "SecondVC")
        
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
