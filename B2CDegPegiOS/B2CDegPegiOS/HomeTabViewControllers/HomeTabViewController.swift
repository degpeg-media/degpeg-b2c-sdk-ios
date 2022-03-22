//
//  HomeTabViewController.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/15/22.

import UIKit

class HomeTabViewController: UITabBarController  {
     
    var rateSchedudeInfo: [String: Any]?
    var isContinueOffline = false
    let button = UIButton.init(type: .custom)
    //MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.setImage(UIImage(named: "EllipseBg"), for: .normal)
        button.backgroundColor = .red
        button.setTitle("Live", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.layer.cornerRadius = 65/2
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        button.layer.shadowOpacity = 2.0
        button.layer.shadowRadius = 2.0
        button.layer.masksToBounds = false
       
       // self.view.insertSubview(button, aboveSubview: self.tabBar)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // safe place to set the frame of button manually
        button.frame = CGRect.init(x: self.tabBar.center.x - 42, y: self.view.bounds.height - 120, width: 65, height: 65)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
 
}
