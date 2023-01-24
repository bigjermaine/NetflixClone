//
//  TitlecollectionviewcellCollectionViewCell.swift
//  Uikit2344
//
//  Created by Apple on 20/01/2023.
//

import UIKit


import SDWebImage


class TitlecollectionviewcellCollectionViewCell: UICollectionViewCell {
   
   static let identirier = "TitleCollectionViewCell"
    
    private let posterimageview: UIImageView  = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
       return imageview
        
    }()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterimageview)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterimageview.frame = contentView.bounds
    }
    
    
    public func configure(with  model: String) {
        
    guard let url = URL(string:"https://image.tmdb.org/t/p/w500/\(model)") else {return}
        
    posterimageview.sd_setImage(with: url , completed: nil)
        
}
    
}
