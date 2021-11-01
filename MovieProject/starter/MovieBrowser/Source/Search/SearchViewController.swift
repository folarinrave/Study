//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit
protocol SearchViewControllerDelegate {
    func done(selectedMovie:Movie)
}
class SearchViewController: UIViewController {
    
    var delegate: SearchViewControllerDelegate?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var searchText = String()
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupVM()
        setupTableView()
        title = "Movie Search"
        view.backgroundColor = .systemBlue
    }
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        let nib = UINib(nibName: customTVCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: customTVCell.identifier)
    }
    func setupVM() {
        viewModel.bind {
            self.tableView.reloadData()
        }
    }
    @IBAction func searchButton(_ sender: UIButton) {
        
        if(searchBar.text != nil)
        {
            searchText = searchBar.text!.replacingOccurrences(of: " ", with: "+")
            print("SEARCH:  \(searchText)")
            viewModel.fetchMovies( searchStr: searchText)
            setupVM()
        }
    }
}
extension SearchViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTVCell.identifier, for: indexPath) as? customTVCell else {
            return UITableViewCell()
        }
        cell.configure(model: viewModel.getModel(row: indexPath.row))
        
        return cell
    }
    
}
extension SearchViewController: UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = viewModel.getModel(row: indexPath.row)
        delegate?.done(selectedMovie: selectedMovie!)
    }
}



extension SearchViewController:UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if(searchBar.text != nil)
        {
            searchText = searchBar.text!.replacingOccurrences(of: " ", with: "+")
            viewModel.fetchMovies(searchStr: searchText)
            setupVM()
        }
    }
}

