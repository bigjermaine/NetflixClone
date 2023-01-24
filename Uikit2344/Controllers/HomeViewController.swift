//
//  HomeViewController.swift
//  Uikit2344
//
//  Created by Apple on 18/01/2023.
//

import UIKit

enum sections: Int {
    
    
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular =  2
    case Upcoming = 3
    case TopRated = 4
    
    
    
}


class HomeViewController: UIViewController {
    
    private var headerView: HeroHeaderUiview?
    private var randomtrendingmovies: Results?
    let sectiontitles: [String] = ["Trednding Movies","Popular","Trending Tv","Upcoming movies","Top rated"]
    private let homeFeedTable: UITableView  = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate  =  self
        homeFeedTable.dataSource =  self
        ConfigureNavBar()
        headerView = HeroHeaderUiview(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        
        homeFeedTable.tableHeaderView = headerView
        
     
        configureheader()
        
    }
    
    private func  ConfigureNavBar() {
        var image = UIImage(named: "NeflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems  = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .gray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        homeFeedTable.frame  =  view.bounds
    }
    
   private func configureheader() {
       ApiCaller.shared.gettrendingmovies { [weak self] results in
            switch results {
            case.success(let titles):
                let selected = titles.randomElement()
                self?.randomtrendingmovies =  selected
                self?.headerView?.configure(with:selected?.posterPath ?? "unknown")
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectiontitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell  =  tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
           return UITableViewCell()
        }
        
        
        
        cell.delegate = self
        
        
        
        switch indexPath.section {
        case  sections.TrendingMovies.rawValue :
            ApiCaller.shared.gettrendingmovies { results in
                switch results {
                case.success(let titles):
                    let selecteditems = titles.randomElement()
                    cell.configure(with: titles)
                   
                case.failure(let error):
                    print(error)
                }
            }
            
            
        default:
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectiontitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header =  view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.textColor = .systemBlue
        header.textLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
        header.textLabel?.text =  header.textLabel?.text?.capitalizedfirstletter()
        
        header.textLabel?.frame = CGRectMake(header.bounds.origin.x+20, header.bounds.origin.y, 100, header.bounds.height )
    }
    

    func scrollViewDidScroll(_ scrollview:UIScrollView) {
        let defaultoffset = view.safeAreaInsets.top
        
        let offset = scrollview.contentOffset.y + defaultoffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}


extension HomeViewController: CollectionTableViewCelldelegate {
    
    
    
    func CollectionTableViewCellDidTapCell( _ cell: CollectionTableViewCell, viewmodel: TitlePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewCollectionViewController()
            
            vc.configure(with: viewmodel)
            
            self?.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        
    }
    
}
