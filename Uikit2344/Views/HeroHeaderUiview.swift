//
//  HeroHeaderUiview.swift
//  Uikit2344
//
//  Created by Apple on 19/01/2023.
//

import UIKit
import SDWebImage
class HeroHeaderUiview: UIView {
    
    
    private let playbutton:  UIButton = {
        
       let button = UIButton()
        button.setTitle("play", for: .normal)
        button.layer.borderColor  =  UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    private let dowloadbutton:  UIButton = {
        
       let button = UIButton()
        button.setTitle("Dowload", for: .normal)
        button.layer.borderColor  =  UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    private let heroimageview:UIImageView =  {
     let imageview = UIImageView()
     imageview.contentMode = .scaleAspectFill
     imageview.clipsToBounds = true
     imageview.image = UIImage(named: "Anime")
     return imageview
        
        
    }()
    private func applyconstriants() {
        
        let playbuttonconstraints = [
            playbutton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            playbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playbutton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
       
        
        let dowloadbuttonConstraints = [
          dowloadbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
          dowloadbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
         dowloadbutton.widthAnchor.constraint(equalToConstant: 120)
           
        ]
        NSLayoutConstraint.activate(dowloadbuttonConstraints)
        NSLayoutConstraint.activate(playbuttonconstraints)
    }
    private func addgradint() {
        
        let gradientlayer =  CAGradientLayer()
        gradientlayer.colors = [UIColor.clear.cgColor,UIColor.systemBackground.cgColor]
        gradientlayer.frame = bounds
        layer.addSublayer(gradientlayer)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroimageview)
        addgradint()
        addSubview(playbutton)
        addSubview(dowloadbutton)
        applyconstriants()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroimageview.frame = bounds
    }
    required init?(coder:NSCoder) {
        fatalError()
    }
    public func configure(with  model:String) {
        
        guard let url = URL(string:"https://image.tmdb.org/t/p/w500/\(model)") else {return}
        
        heroimageview.sd_setImage(with: url , completed: nil)
        
 }
}
