//
//  CollectionTableViewCell.swift
//  Uikit2344
//
//  Created by Apple on 19/01/2023.
//

import UIKit
protocol CollectionTableViewCelldelegate: AnyObject {
    func  CollectionTableViewCellDidTapCell(_ cell:CollectionTableViewCell,viewmodel:TitlePreviewViewModel)
    
    
    
}
class CollectionTableViewCell: UITableViewCell {

    static let identifier =  "CollectionTableViewCell"
    private var titles:[Results] = [Results]()
    
    weak var delegate:CollectionTableViewCelldelegate?
    
    private let collectioview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize  = CGSize(width: 140, height: 200 )
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitlecollectionviewcellCollectionViewCell.self, forCellWithReuseIdentifier: TitlecollectionviewcellCollectionViewCell.identirier)
        return collectionView
        
        
    }()
    
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(collectioview)
        collectioview.delegate = self
        collectioview.dataSource = self
    }

    required init?(coder:NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectioview.frame  = contentView.bounds
    }
    public func configure(with titles:  [Results]) {
        self.titles = titles
        DispatchQueue.main.async { [weak self] in
            self?.collectioview.reloadData()
        }
        
    }
}



extension CollectionTableViewCell:  UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: TitlecollectionviewcellCollectionViewCell.identirier, for: indexPath) as? TitlecollectionviewcellCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = titles[indexPath.row].posterPath
        cell.configure(with: model)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = titles[indexPath.row]
        guard let titlename = title.originalTitle ?? title.originalName else { return }
       
        
        
        ApiCaller.shared.getyoutube(with: titlename + "trailer") { [ weak self ] ressult in
            
            switch ressult {
            case.success(let videoelement):
                let title = self?.titles[indexPath.row]
                guard let strongself = self else { return }
                let viewmodel = TitlePreviewViewModel(title: titlename, youtubeview:videoelement , titleoverview: (title?.overview ??  title?.originalName) ?? "unknown" )
                self?.delegate?.CollectionTableViewCellDidTapCell(strongself, viewmodel: viewmodel)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
    }

 }

