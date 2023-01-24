//
//  fTableViewCell.swift
//  Uikit2344
//
//  Created by Apple on 22/01/2023.
//

import UIKit
import SDWebImage



class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    
    private let titlesposterimageview: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
        
    }()
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playbutton2:  UIButton = {
        
       let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlesposterimageview)
        contentView.addSubview(titlelabel)
        contentView.addSubview(playbutton2)
        applycinstraints()
    }
    
    
//   override func layoutSubviews() {
//        super.layoutSubviews()
//        titlesposterimageview.frame  = contentView.bounds
//   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public func configure(with  model: Results2) {
        
        guard let url = URL(string:"https://image.tmdb.org/t/p/w500/\(model.poster)") else {return}
        
    titlesposterimageview.sd_setImage(with: url , completed: nil)
        titlelabel.text = model.name
}
    private func applycinstraints() {
        
        let imageviewconstriants = [
            titlesposterimageview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesposterimageview.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            titlesposterimageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            titlesposterimageview.widthAnchor.constraint(equalToConstant: 100)
        
        
        
        ]
        let playbuttonviewconstriants = [
            playbutton2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            playbutton2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           
        
        
        ]
        let labelbuttonviewconstriants = [
            titlelabel.leadingAnchor.constraint(equalTo:titlesposterimageview.trailingAnchor,constant: 20),
            titlelabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
           
        
        
        ]
       
        NSLayoutConstraint.activate(imageviewconstriants)
        NSLayoutConstraint.activate(playbuttonviewconstriants)
        NSLayoutConstraint.activate(labelbuttonviewconstriants)
       
    }
}
