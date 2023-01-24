//
//  SearchViewController.swift
//  Uikit2344
//
//  Created by Apple on 18/01/2023.
//

import UIKit



class SearchViewController: UIViewController {
    
    
    public var titles:[Results] = [Results]()
    
    public  let discoverableviewTable: UITableView  = {
        let table = UITableView()
        
        table.register(TitleTableViewCell.self, forCellReuseIdentifier:TitleTableViewCell.identifier)
        return table
        
    }()
    private let searchcontoller: UISearchController = {
        let controller = UISearchController(searchResultsController:SearchResultViewController())
        controller.searchBar.placeholder = "Search here"
        
        controller.searchBar.searchBarStyle = .minimal
        return controller
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(discoverableviewTable)
        discoverableviewTable.delegate =  self
        discoverableviewTable.dataSource = self
        navigationItem.searchController = searchcontoller
        title  =  "search Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        getTrendingMovies()
    }
    
    
   
    
    private func getTrendingMovies() {
        ApiCaller.shared.gettrendingmovies { [weak self] results in
            switch results {
            case.success(let movies):
                self?.titles = movies
                
                DispatchQueue.main.async {
                    self?.discoverableviewTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
   
}
extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else { return UITableViewCell()
            
        }
        
        let model = titles[indexPath.row].posterPath
        let model2 = titles[indexPath.row].originalName ??  titles[indexPath.row].originalTitle ?? "Unknown"
         cell.configure(with: Results2(name: model2, poster: model))
         
         return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}




extension SearchViewController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              
                let resultsContoller = searchController.searchResultsController as? SearchResultViewController else {
            return
        }
        
        
        ApiCaller.shared.getsearch2(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let titles):
                    resultsContoller.titles = titles
                    resultsContoller.collectioview.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        }
        
    }
    
    
}
