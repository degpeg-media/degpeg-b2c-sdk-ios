//
//  CategoryPage.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/15/22.
//

import UIKit
 
class CategoryPage: UIViewController,UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    var arrayPlaylist = NSMutableArray()
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    private var reachability:Reachability?
    let chatButton = UIButton()
    let notiButton = UIButton()
    let networkErrorButton = UIButton()
    var tableViewServices = UITableView()
    var arrayTitles = NSMutableArray()
    
    enum TableSection {
        static let productCategories = 0
        static let brandsWeHave = 1
        static let trendingVideos = 2
        static let count = 3
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       //self.title = "Calender"
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        view.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        arrayPlaylist = ["unsplash", "unsplash", "unsplash","unsplash","unsplash", "unsplash", "unsplash","unsplash"]
        
        arrayTitles = ["Product Categories", "Brands We Have", "Trending Videos"]
        uiShowUpBadges()
        tableViewServices.frame = CGRect(x: 0, y: 90, width: screenWidth, height: screenHeight-190)
        tableViewServices.backgroundColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
        tableViewServices.delegate = self
        tableViewServices.dataSource = self
        tableViewServices.bounces = false
        tableViewServices.separatorStyle = .none
        tableViewServices.estimatedRowHeight = 60
        tableViewServices.rowHeight = UITableView.automaticDimension
        tableViewServices.register(UITableViewCell.self,forCellReuseIdentifier:"myappcell")
        tableViewServices.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        tableViewServices.backgroundColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
        tableViewServices.layer.cornerRadius = 8.0
        tableViewServices.clipsToBounds = true
        tableViewServices.separatorStyle = .none
        view.addSubview(tableViewServices)
        tableViewServices.isMultipleTouchEnabled = false
       
        
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
    // MARK: - Register Nibs
  
    //MARK: Change Event
    @objc func clickChange(_ sender:AnyObject!) {
    }
    
    //MARK: - Table methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayTitles.count
    }
    
    func getCellHeight(_ index: Int) -> CGFloat {
//        if self.servicesArray.count > 0 {
//            if let dictMain = self.servicesArray[index] as? NSDictionary {
//                let title = dictMain["service_description"] as? String ?? ""
//                return title.heightWithConstrainedWidth(screenWidth - 80, font: UIFont.systemFont(ofSize: 17.0)) + 55
//            }
//        }
        if index == TableSection.productCategories {
            return 200
        }
        if index == TableSection.brandsWeHave {
            return 100
        }
        if index == TableSection.trendingVideos {
            return 200
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == TableSection.productCategories {
            return 200
        }
        if indexPath.section == TableSection.brandsWeHave {
            return 100
        }
        if indexPath.section == TableSection.trendingVideos {
            return 200
        }
        return 0
   }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellHeight: CGFloat = getCellHeight(indexPath.section)
        let CellIdentifier: String = "myappcell"
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)!
        cell = UITableViewCell(style:.default,reuseIdentifier:CellIdentifier)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        for view: UIView in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        
        let imgView_Bg = UIImageView()
        imgView_Bg.backgroundColor = UIColor(red:255.0 / 255.0, green:255.0 / 255.0, blue:255.0 / 255.0, alpha:1.0)
        imgView_Bg.backgroundColor = UIColor.white
        imgView_Bg.layer.cornerRadius = 6
        imgView_Bg.clipsToBounds = true
        imgView_Bg.isUserInteractionEnabled = true
        cell.addSubview(imgView_Bg)
        imgView_Bg.frame = CGRect(x: 0, y: 4, width: screenWidth, height: CellHeight)
        let layoutPlaylist = UICollectionViewFlowLayout()
        let collectionPlaylist = UICollectionView(frame: CGRect(x:10, y: 2, width: screenWidth-20, height: CellHeight), collectionViewLayout: layoutPlaylist)
        layoutPlaylist.scrollDirection = .horizontal
        collectionPlaylist.dataSource = self
        collectionPlaylist.delegate = self
        collectionPlaylist.isScrollEnabled = true
        collectionPlaylist.isPagingEnabled = true
        collectionPlaylist.bounces = true
        collectionPlaylist.tag = indexPath.section
        collectionPlaylist.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionPlaylist.backgroundColor = .white//UIColor(red: 25.0/225.0, green: 31.0/225.0, blue: 45.0/225.0, alpha: 1)
        collectionPlaylist.showsHorizontalScrollIndicator = false
        collectionPlaylist.showsVerticalScrollIndicator = true
        layoutPlaylist.minimumInteritemSpacing = 0
        layoutPlaylist.minimumLineSpacing = 0
        imgView_Bg.addSubview(collectionPlaylist)
        
       if indexPath.section == TableSection.productCategories {
       }
       if indexPath.section == TableSection.brandsWeHave {
       }
       if indexPath.section == TableSection.trendingVideos {
       }
       return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView()
        sectionHeader.frame = CGRect(x: 0, y: 0, width: screenWidth , height: 44)
        sectionHeader.backgroundColor = .clear
        let heading = UILabel()
        heading.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 42)
        heading.textColor = UIColor.black
        heading.font = UIFont(name: heading.font!.fontName, size: 16)
        heading.backgroundColor = .white
        sectionHeader.addSubview(heading)
        
        heading.text = "  \(arrayTitles[section] as? String ?? "")"
        UIFont.boldSystemFont(ofSize: 18)
        heading.backgroundColor = .clear
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayPlaylist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
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
        
        prodName.numberOfLines = 3
        prodName.text = "Comedy"
        prodName.backgroundColor = .clear
        prodName.textAlignment = .left
        prodName.textColor = .white
        prodName.font = UIFont.boldSystemFont(ofSize: 15)
        
        let btnLive = UIButton(frame: CGRect(x: 8, y: 10, width: 45, height: 28))
        btnLive.setTitle("Live", for: .normal)
        btnLive.layer.cornerRadius = 7
        btnLive.clipsToBounds = true
        //btnLive.setImage(UIImage(named: "rightColorarr"), for: .normal)
        btnLive.backgroundColor = .red
        btnLive.setTitleColor(UIColor.white, for: .normal)
//        btnLive.addTarget(self, action: #selector(self.btnLive), for: .touchUpInside)
       // imgage.addSubview(btnLive)

        let btnEye = UIButton(frame: CGRect(x: (btnLive.frame.maxX+1) , y: 10, width: 70, height: 30))
        btnEye.setTitle("23K", for: .normal)
        btnEye.setTitleColor(UIColor.white, for: .normal)
        btnEye.setImage(UIImage(named: "greyEye"), for: .normal)
        btnEye.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 15)
        btnEye.titleEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        //imgage.addSubview(btnEye)
                viewBG.frame = CGRect(x: 2, y: 2, width: (cell?.frame.size.width)!-4, height: (cell?.frame.size.height)!-4)
                //calenderimg.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
                
                //datetext.frame = CGRect(x: calenderimg.frame.maxX+1, y:0, width: viewBG.frame.width-(calenderimg.frame.width+2), height: 35)
                imgage.frame = CGRect(x: 0, y:0, width: viewBG.frame.width, height: viewBG.frame.height)
               //prodName.frame = CGRect(x: 7, y:imgage.frame.maxY+7, width: imgage.frame.width-10, height: 30)
                let strimg = arrayPlaylist[indexPath.row] as? String ?? ""
                imgage.image = UIImage(named: strimg)
                imgage.contentMode = .scaleAspectFill
                imgage.clipsToBounds = true
                imgage.layer.cornerRadius = 6
        if collectionView.tag == TableSection.productCategories  {
             prodName.frame = CGRect(x: 5, y: 2, width: imgage.frame.width-10, height: 30)
            imgage.addSubview(prodName)
        }
        if collectionView.tag == TableSection.trendingVideos {
            let btnLive = UIButton(frame: CGRect(x: 8, y: 10, width: 45, height: 28))
            btnLive.setTitle("Live", for: .normal)
            btnLive.layer.cornerRadius = 7
            btnLive.clipsToBounds = true
            //btnLive.setImage(UIImage(named: "rightColorarr"), for: .normal)
            btnLive.backgroundColor = .red
            btnLive.setTitleColor(UIColor.white, for: .normal)
//            btnLive.addTarget(self, action: #selector(self.btnLive), for: .touchUpInside)
            imgage.addSubview(btnLive)
            

            let btnEye = UIButton(frame: CGRect(x: (btnLive.frame.maxX+1) , y: 10, width: 70, height: 30))
            btnEye.setTitle("23K", for: .normal)
            btnEye.setTitleColor(UIColor.white, for: .normal)
            btnEye.setImage(UIImage(named: "greyEye"), for: .normal)
            btnEye.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 15)
            btnEye.titleEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
            imgage.addSubview(btnEye)
        }

            return cell!
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            return CGSize(width:  CGFloat( (screenWidth-20)/2.3), height: 96)
        }
        if collectionView.tag == 1 {
            return CGSize(width:  CGFloat((screenWidth-20)/3.0) , height: 100)
        }
        if collectionView.tag == 2 {
            return CGSize(width:  CGFloat((screenWidth-20)/2.2) , height: 200)
        }
        return CGSize(width:  CGFloat((screenWidth-20)/2.5) , height: 220)
     }
}
