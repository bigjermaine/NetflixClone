//
//  TitlePreviewCollectionViewController.swift
//  Uikit2344
//
//  Created by Apple on 24/01/2023.
//

import UIKit
import WebKit

class TitlePreviewCollectionViewController: UIViewController {
    
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Harry Potter"
        return label
    }()
    
    private let overviewtitlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "this is the best movie ever"
        return label
    }()
    
    
    private let webView:WKWebView = {
        let webview  = WKWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
        
    }()
    
    
    private let playbutton2:  UIButton = {
        
       let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Dowload", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(titlelabel)
        view.addSubview(overviewtitlelabel)
        view.addSubview(playbutton2)
        view.addSubview(webView)
        configureconstraints()
    }
    ///constraints varaibles function
    func configureconstraints() {
        let webconstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        
        let titlelabelconstraints = [
            titlelabel.bottomAnchor.constraint(equalTo:  webView.bottomAnchor, constant: 50),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
        ]
        let   overviewtitlelabelconstraints = [
            overviewtitlelabel.bottomAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 100),
            overviewtitlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            overviewtitlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ]
        let  playbutton2playbutton2constraints  = [
            playbutton2.bottomAnchor.constraint(equalTo:  overviewtitlelabel.bottomAnchor, constant: 50),
          
            playbutton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playbutton2.widthAnchor.constraint(equalToConstant: 140),
            playbutton2.heightAnchor.constraint(equalToConstant: 40)
            
        ]
        NSLayoutConstraint.activate(playbutton2playbutton2constraints)
        NSLayoutConstraint.activate(overviewtitlelabelconstraints)
        NSLayoutConstraint.activate(titlelabelconstraints)
        NSLayoutConstraint.activate(webconstraints)
    }
    
    
    
    public func configure(with  model: TitlePreviewViewModel) {
        titlelabel.text = model.title
        overviewtitlelabel.text =  model.titleoverview

            guard let url = URL(string:"https://www.youtube.com/embed/\(model.youtubeview.id.videoId)") else {return}
            
            
            webView.load(URLRequest(url: url))
        
    }
}
