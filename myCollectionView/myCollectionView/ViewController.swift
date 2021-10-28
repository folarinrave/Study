//
//  ViewController.swift
//  myCollectionView
//
//  Created by Limei  Chen on 10/20/21.
//

import UIKit

protocol ViewControllerDelegate {
    func goToNext(address: String)
}

class ViewController: UIViewController {
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    var delegate: ViewControllerDelegate?
    
    var myCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    var data: [Model.Data.Children] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 130, height: 180)
        
        myCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        myCollectionView.backgroundColor = .systemYellow
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        view.addSubview(myCollectionView)
                
        ViewModel.fetch { response in
            self.data = response.data.children
            
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
        }
    }
    
//    stop the spinner once the view appeared
    override func viewDidAppear(_ animated: Bool) {
        self.spinner.stopAnimating()
    }
//    create controller
    func create() -> ViewController {
        let controller = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as! ViewController
        return controller
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionViewCell
        myCell.backgroundColor = .white
        let nestedData = data[indexPath.row].data
        myCell.titleLabel.text = "Title: \(nestedData.title)"
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("User tapped on item \(indexPath.row + 1)")
        let nestedData = data[indexPath.row].data
        let redditUrl = nestedData.url
        let _ = spinner
        spinner.showIn(view)
        print("This is the urlData:  \(redditUrl)")
        delegate?.goToNext(address:redditUrl )
    }
    
}

extension UIActivityIndicatorView {
    func showIn(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startAnimating()
    }
}

