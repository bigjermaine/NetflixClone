//
//  ViewController.swift
//  Uikit2344
//
//  Created by Apple on 18/01/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        let vc =  UINavigationController(rootViewController:  HomeViewController())
        let vc1 =  UINavigationController(rootViewController: UpcomingVViewController())
        let vc2 =  UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: DowloadedCollectionViewController())
        
        
        
        setViewControllers([vc,vc1,vc2,vc3,vc3], animated: true)
        
        vc.tabBarItem.image = UIImage(systemName: "house")
        
        vc1.tabBarItem.image = UIImage(systemName: "play.circle")
        
        vc2.tabBarItem.image = UIImage(systemName: "viewfinder.circle")
        
        vc3.tabBarItem.image = UIImage(systemName: "arrow.down")
        
        vc.title = "Home"
        vc1.title = "coming soon"
        vc2.title = "top search"
        vc3.title = "downloads"
        
        
        
      }
    }




