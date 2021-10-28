//
//  ViewController.swift
//  CollectionView
//
//  Created by Daniel Brannon on 10/20/21.
//

import UIKit

protocol ViewControllerDelegate {
    func done(url: String)
}

class ViewController: UIViewController {
    
    var myData: [Children] = []
    var delegate: ViewControllerDelegate?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
    
    }

    static func create() -> ViewController {
        let controller = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as! ViewController
        
        return controller
    }
    override func viewDidAppear(_ animated: Bool) {
        ViewModel.fetch{ resp in
            DispatchQueue.main.async {
                self.myData = resp.data.children
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            print("failed to dequeue cell")
            fatalError()
        }
        cell.setLabel(string: myData[indexPath.row].data.title)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 180)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.done(url: myData[indexPath.row].data.url)
            }

}
