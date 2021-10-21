//
//  ViewController.swift
//  CollectionView
//
//  Created by rave on 10/20/21.
//


import UIKit

class ViewController: UIViewController, Coordinating
{
    var coordinator: Coordinator?
    var titleArray = [Model.Data.Children]()
    let cellId = "CellId"; //Unique cell id
    
    private let collectionView: UICollectionView = { // collection view to be added to view controller
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()); //zero size with flow layout
        cv.translatesAutoresizingMaskIntoConstraints = false; //set it to false so that we can supply constraints
        return cv;
    }();
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private lazy var errorAlert: UIAlertController = {
        let alert = UIAlertController(title: "Error!",
                                      message: "Something's wrong in ViewControl.",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(collectionViewCell.self, forCellWithReuseIdentifier: cellId) //register collection view cell class
        setupViews(); //setup all views
        spinner.showSpinner(view)
        callTheDamnAPI(URLStr: "https://www.reddit.com/r/nfl/.json" )
        collectionView.backgroundColor = .red
        
    }
    override func viewDidAppear(_ animated: Bool) {
      self.spinner.stopAnimating()
    }
    
    private func callTheDamnAPI(URLStr:String) {
        ViewModel.fetch ( { result in
            
            //  print("RESULT: \(result)")
            DispatchQueue.main.async {
                
                switch result {
                case let .success(response):
                    self.titleArray = response.data.children
                case .failure:
                    self.present(self.errorAlert, animated: true, completion: nil)
                }
                
                self.spinner.stopAnimating()
                self.collectionView.reloadData()
                
            }
        }, searchURL: URLStr)
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupViews() {
        
        view.addSubview(collectionView); // add collection view to view controller
        collectionView.delegate = self; // set delegate
        collectionView.dataSource = self; //set data source
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true; //set the location of collection view
        collectionView.rightAnchor.constraint(equalTo:  view.rightAnchor).isActive = true; // top anchor of collection view
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true; // height
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true; // width
        
    }
    
    
    
    //deque cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! collectionViewCell;
        cell.titleLabel.text = titleArray[indexPath.row].data.title
        cell.backgroundColor = .white
        return cell;
    }
    
    // number of items in grid
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count;
    }
    
    //size of each CollecionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: view.frame.width, height: 100);
        return CGSize(width: 130, height: 180);
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //print("Collection item selected at: \(indexPath.row)")
        spinner.showSpinner(view)
        coordinator?.eventOccurred(with: .buttonTapped, urlStr: titleArray[indexPath.row].data.url.description, titleStr: titleArray[indexPath.row].data.title.description)
        
        
    }
    
    
}


