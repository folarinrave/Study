//
//  ViewController.swift
//  CollectionView
//
//  Created by Limei  Chen on 10/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionConstraint()
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.backgroundColor = UIColor.red
        
    }
    func setupCollectionConstraint() {
        view.addSubview(myCollectionView) 
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        myCollectionView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        myCollectionView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
