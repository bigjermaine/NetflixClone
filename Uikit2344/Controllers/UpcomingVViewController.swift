 //
//  UpcomingVViewController.swift
//  Uikit2344
//
//  Created by Apple on 18/01/2023.
//

import UIKit



class UpcomingVViewController: UIViewController {
    private var titles:[Results] = [Results]()
    private let upcomingviewTable: UITableView  = {
        let table = UITableView()
        
        table.register(TitleTableViewCell.self, forCellReuseIdentifier:TitleTableViewCell.identifier)
        return table
        
    }()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title  =  "upcoming movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        
        view.addSubview(upcomingviewTable)
        upcomingviewTable.delegate =  self
        upcomingviewTable.dataSource = self
        getTrendingMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingviewTable.frame = view.bounds
    }
    
    private func getTrendingMovies() {
        ApiCaller.shared.gettrendingmovies { [weak self] results in
            switch results {
            case.success(let movies):
                self?.titles = movies
                
                DispatchQueue.main.async {
                    self?.upcomingviewTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension UpcomingVViewController: UITableViewDelegate,UITableViewDataSource {
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
        return 150
    }
    
}
