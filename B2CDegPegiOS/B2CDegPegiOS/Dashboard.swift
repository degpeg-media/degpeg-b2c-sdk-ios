//  Dashboard.swift
//  B2CDegPegiOS
//  Created by Apple on 3/15/22.

import UIKit
 
class Dashboard: UIViewController {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1.0)
       
       
        let imgViewLogo = UIImageView()
        imgViewLogo.frame = CGRect(x: 60 , y: 60, width: 120, height: 50)
        imgViewLogo.backgroundColor = UIColor.white
        imgViewLogo.image = UIImage(named: "degpeg-logo")
        imgViewLogo.isUserInteractionEnabled = true
        imgViewLogo.contentMode = .scaleAspectFit
        imgViewLogo.clipsToBounds = true
        self.view.addSubview(imgViewLogo)
    }
    
}
 
