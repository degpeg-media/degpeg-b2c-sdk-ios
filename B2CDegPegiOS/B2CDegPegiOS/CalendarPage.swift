//
//  CalendarPage.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/15/22.
//

import UIKit
class CalendarPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var collectionPlaylist :UICollectionView!
    var layoutPlaylist: UICollectionViewFlowLayout!
    var arrayPlaylist = NSMutableArray()
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    private var reachability:Reachability?
    let chatButton = UIButton()
    let notiButton = UIButton()
    let networkErrorButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        view.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
      
        arrayPlaylist = ["unsplash", "unsplash", "unsplash","unsplash","unsplash", "unsplash", "unsplash","unsplash"]
        uiShowUpBadges()
        uiCollectionView()
        self.title = "Calender"
        
    }
    
    @IBAction func hamburgerBtnAction(_ sender: UIBarButtonItem) {
      HamburgerMenu().triggerSideMenu()
    }
    func uiShowUpBadges() {
        let chatIcon: UIImage = UIImage(named: "ic_toolbar_message")!
        let tintedchatIcon = chatIcon.withRenderingMode(.alwaysTemplate)
        chatButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        chatButton.setImage(tintedchatIcon, for: .normal)
        chatButton.tintColor = UIColor.gray
        chatButton.backgroundColor = UIColor.clear
//        chatButton.addTarget(self, action: #selector(self.chat), for: .touchUpInside)
        let chatItem = UIBarButtonItem(customView: chatButton)

        let notiIcon: UIImage = UIImage(named: "notification_icon")!
        let tintedncImage = notiIcon.withRenderingMode(.alwaysTemplate)
        notiButton.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(30), height: CGFloat(30))
        notiButton.tintColor = UIColor.gray
        notiButton.setImage(tintedncImage, for: .normal)
        
        let spacing: CGFloat! = 7;
        //notiButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -spacing);
        notiButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        notiButton.tintColor = UIColor.gray
//      notiButton.addTarget(self, action: #selector(self.notification), for: .touchUpInside)
        let notiItem = UIBarButtonItem(customView:notiButton)
    
        
        self.navigationItem.setRightBarButtonItems([ notiItem,chatItem], animated: false)
        //self.navigationItem.setLeftBarButtonItems([chatItem], animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor.black
//        if let count = UserDefaults.standard.object(forKey: UserInfo.notifiCountUd) as? Int {
//            notiButton.badgeValue = "\(count)"
//        } else {
//            notiButton.badgeValue = "0"
//        }
//        if let messageCount = UserDefaults.standard.value(forKey:  UserInfo.pubnubMessagesCount) as? Int, messageCount > 0 {
//            chatButton.badgeValue = "\(messageCount)"
//        } else {
//            chatButton.badgeValue = "0"
//        }
//        notiButton.badgeValue = "1"
//        chatButton.badgeValue = "4"
        reachability = Reachability()!
        reachability!.whenReachable = { reachability in
            //self.navigationItem.setRightBarButtonItems([consultationFlowItem, notiItem,chatItem], animated: false)
        }
        reachability?.whenUnreachable = { reachability in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                  self.networkError()
            }
        }
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    func uiCollectionView() {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 15, y: 90, width: screenWidth-20, height: 45)
        titleLabel.text = "Upcoming Shows"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.boldSystemFont(ofSize: 19.0)
        self.view.addSubview(titleLabel)
    
        layoutPlaylist = UICollectionViewFlowLayout()
        collectionPlaylist = UICollectionView(frame: CGRect(x: 6, y: titleLabel.frame.maxY+5, width: screenWidth-12, height: screenHeight-270), collectionViewLayout: layoutPlaylist)
    layoutPlaylist.scrollDirection = .vertical
    collectionPlaylist.dataSource = self
    collectionPlaylist.delegate = self
    collectionPlaylist.isScrollEnabled = true
    collectionPlaylist.isPagingEnabled = true
    collectionPlaylist.bounces = true
    collectionPlaylist.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
    collectionPlaylist.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
    collectionPlaylist.backgroundColor = .white//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
    collectionPlaylist.showsHorizontalScrollIndicator = false
    collectionPlaylist.showsVerticalScrollIndicator = true
    layoutPlaylist.minimumInteritemSpacing = 0
    layoutPlaylist.minimumLineSpacing = 0
    self.view.addSubview(collectionPlaylist)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayPlaylist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("SearchMusicVC Collection View setup")
  
        let cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
            for view: UIView in (cell?.contentView.subviews)! {
                view.removeFromSuperview()
            }
        cell?.contentView.backgroundColor = .white
        
            let viewBG: UIView! = UIView()
            viewBG.backgroundColor = .clear
            viewBG.layer.cornerRadius = 0
            viewBG.backgroundColor = .white//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
            viewBG.layer.borderWidth = 0.0;
            viewBG.layer.borderColor = UIColor.lightGray.cgColor
            viewBG.clipsToBounds = true
            cell?.contentView.addSubview(viewBG)
          
        let calenderimg: UIImageView! = UIImageView()
        calenderimg.frame = CGRect(x: 5, y: 0, width: 25, height: 25)
        calenderimg.image = UIImage(named: "calendar")
        calenderimg.contentMode = .scaleAspectFill
        calenderimg.backgroundColor = .white//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
        calenderimg.layer.borderWidth = 0.0;
        calenderimg.layer.borderColor = UIColor.lightGray.cgColor
        calenderimg.clipsToBounds = true
        viewBG.addSubview(calenderimg)
        
        let datetext: UILabel! = UILabel()
        
        datetext.text = "July 20, Friday @ 1:46AM"
        datetext.numberOfLines = 1
        datetext.backgroundColor = .clear//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
        datetext.textAlignment = .left
        datetext.textColor = .black
        datetext.font = UIFont.boldSystemFont(ofSize: 11)
        viewBG.addSubview(datetext)
        
        let imgage: UIImageView! = UIImageView()
        imgage.frame = CGRect(x: 5, y: datetext.frame.maxY+1, width: viewBG.frame.width-10, height: viewBG.frame.height-30)
        imgage.layer.cornerRadius = 8
        imgage.contentMode = .scaleAspectFill
        imgage.backgroundColor = .white//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
        imgage.layer.borderWidth = 0.0;
        imgage.layer.borderColor = UIColor.lightGray.cgColor
        imgage.clipsToBounds = true
        viewBG.addSubview(imgage)
                
        let prodName: UILabel! = UILabel()
        prodName.frame = CGRect(x: 5, y:imgage.frame.maxY+2, width: imgage.frame.width-10, height: 30)
        prodName.numberOfLines = 3
        prodName.text = "Live Shopping alea"
        prodName.backgroundColor = .clear//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
        prodName.textAlignment = .left
        prodName.textColor = .black
        prodName.font = UIFont.boldSystemFont(ofSize: 11)
        viewBG.addSubview(prodName)
        
        let btnLive = UIButton(frame: CGRect(x: 8, y: 10, width: 45, height: 28))
        btnLive.setTitle("Live", for: .normal)
        btnLive.layer.cornerRadius = 7
        btnLive.clipsToBounds = true
        //btnLive.setImage(UIImage(named: "rightColorarr"), for: .normal)
        btnLive.backgroundColor = .red
        btnLive.setTitleColor(UIColor.white, for: .normal)
        btnLive.addTarget(self, action: #selector(self.btnLive), for: .touchUpInside)
        imgage.addSubview(btnLive)
        

        let btnEye = UIButton(frame: CGRect(x: (btnLive.frame.maxX+1) , y: 10, width: 70, height: 30))
        btnEye.setTitle("23K", for: .normal)
        btnEye.setTitleColor(UIColor.white, for: .normal)
        btnEye.setImage(UIImage(named: "greyEye"), for: .normal)
        btnEye.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 15)
        btnEye.titleEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        imgage.addSubview(btnEye)

            if collectionView == collectionPlaylist {
                viewBG.frame = CGRect(x: 2, y: 2, width: (cell?.frame.size.width)!-4, height: (cell?.frame.size.height)!-4)
                calenderimg.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
                
                datetext.frame = CGRect(x: calenderimg.frame.maxX+1, y:0, width: viewBG.frame.width-(calenderimg.frame.width+2), height: 35)
                imgage.frame = CGRect(x: 0, y:datetext.frame.maxY+5, width: viewBG.frame.width, height: viewBG.frame.height-80)
                prodName.frame = CGRect(x: 7, y:imgage.frame.maxY+7, width: imgage.frame.width-10, height: 30)
                let strimg = arrayPlaylist[indexPath.row] as? String ?? ""
                imgage.image = UIImage(named: strimg)
                imgage.contentMode = .scaleAspectFill
                imgage.clipsToBounds = true
                imgage.layer.cornerRadius = 10
//                if let appointment = self.arrayPlaylist[indexPath.row] as? NSDictionary {
//                    if let doctorName = appointment["content_title"] as? String {
//                        prodName.text = doctorName.capitalized
//                    }
//                    if let image = appointment["image"] as? String {
//                       let cache = ImageLoadingWithCache()
//                       cache.getImage(url: image, imageView: imgage, defaultImage: "placeHolder")
//                    }
//                }
            }
            return cell!
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  CGFloat((screenWidth-20)/2.0) , height: 220)
     }
    @objc func btnEye(sender : UIButton) {
                    //Write button action here
    }
    @objc func btnLive(sender : UIButton) {
                    //Write button action here
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
