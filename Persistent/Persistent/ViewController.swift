//
//  ViewController.swift
//  Persistent
//
//  Created by Limei  Chen on 10/18/21.
//

import UIKit


class ViewController: UIViewController {
    let tableView = UITableView()
    
     var responseData:Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        if let read = try? DiskStorage.read(fromKey: "encodedData2") {
            print("oliv data retrieve: \(read)")
            let DataStr = Data(read.utf8)
            guard let responseData =  try? JSONDecoder().decode(Model.self,from: DataStr )else {
                return
            }
            self.responseData = responseData
//            tableView.dataSource = self
            tableView.reloadData()
        } else {
            print("no file found")
            
            ViewModel.fetch { response in
                self.responseData = response
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    let data: Data? = try? JSONEncoder().encode(self.responseData)
                    let string = String(data:data!, encoding: .utf8)
                     
                    guard let _ = try? DiskStorage.save(withKey: "encodedData2", value: string!) else{
                        print("can't save file")
                        return
                    }
                    print("data saved to the fileURL encodedData2")
                }
            }
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (responseData != nil) {
        return responseData!.data.children.count

        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let nestedData = responseData?.data.children[indexPath.row].data
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Title: \(nestedData?.title ?? " ")"

        return cell
    }
}


