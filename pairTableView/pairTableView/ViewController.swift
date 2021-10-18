//
//  ViewController.swift
//  pairTableView
//
//  Created by Daniel Brannon on 10/14/21.
//

import UIKit

class ViewController: UIViewController {

    let titles = [
        1,2,3,4,5,6
    ]
    let subtitles = [
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
        "Six"
    ]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyTableViewCell")
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as? MyTableViewCell else {
            fatalError()
        }
        let titleInt = titles[indexPath.row]
        let titleStr = String(titleInt)
        cell.leftLabel.text = titleStr
        cell.rightLabel.text = subtitles[indexPath.row]
        return cell
    }
    
    
}
