//  LivePage.swift
//  B2CDegPegiOS
//  Created by Apple on 3/15/22.

import UIKit
 
class LivePage: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var reachability:Reachability?
    let chatButton = UIButton()
    let notiButton = UIButton()
    let networkErrorButton = UIButton()
    var viewScrollBg = UIView()
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    
    var scrollViewWalk = UIScrollView()
    var kArrayNo: Int = 0
    var totalPage: Int = 0
    var arrowBool = false
    var arraysplashImages = NSMutableArray()
    var arrayPlaylist = NSMutableArray()
    var pageControl = UIPageControl()
    
    var collectionPlaylist :UICollectionView!
    var layoutPlaylist: UICollectionViewFlowLayout!
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
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        arraysplashImages = ["unsplash", "unsplash", "unsplash","unsplash"]
        arrayPlaylist = ["unsplash", "unsplash", "unsplash","unsplash"]
        view.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        uiShowUpBadges()
        self.title = "Degpeg"
        self.UiSetUp()
       
    }
    
    @IBAction func hamburgerBtnAction(_ sender: UIBarButtonItem) {
      HamburgerMenu().triggerSideMenu()
    }
    // MARK: - Find Network Connection Status
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
        self.navigationItem.setLeftBarButtonItems([chatItem], animated: false)
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
    
    func UiSetUp() {
        viewScrollBg = UIView()
        viewScrollBg.frame = CGRect(x: 0, y: 60, width: self.view.frame.size.width, height: self.view.frame.size.height-140)
        viewScrollBg.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.view.addSubview(viewScrollBg)
        
        scrollViewWalk = UIScrollView()
        scrollViewWalk.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:320)
        scrollViewWalk.delegate = self
        scrollViewWalk.isPagingEnabled = true
        scrollViewWalk.backgroundColor = .clear
        viewScrollBg.addSubview(scrollViewWalk)
        scrollViewWalk.reloadInputViews()
        pageControl = UIPageControl()
      
        totalPage = Int(arraysplashImages.count)
        kArrayNo = 0
        DispatchQueue.main.async {
            for index in 0..<self.arraysplashImages.count {
                self.pageControl.numberOfPages = self.arraysplashImages.count
                self.pageControl.currentPage = 0
               
                     // self.pageControl.currentPage = photoIndex
              
                
                let imgViewSplash = UIImageView()
                imgViewSplash.frame = CGRect(x: (self.view.frame.size.width * CGFloat(index)), y: 0, width: self.view.frame.size.width,height: self.scrollViewWalk.frame.size.height)
                imgViewSplash.backgroundColor = UIColor.white
                let docImage = self.arraysplashImages[index]  as? String ?? ""
                print("docImage: %@", docImage)
                imgViewSplash.image = UIImage(named: docImage)
                imgViewSplash.isUserInteractionEnabled = true
                imgViewSplash.contentMode = .scaleAspectFill
                imgViewSplash.clipsToBounds = true
                self.scrollViewWalk.addSubview(imgViewSplash)
                
                let btnLive = UIButton(frame: CGRect(x: 10, y: 10, width: 55, height: 28))
                btnLive.setTitle("Live", for: .normal)
                btnLive.layer.cornerRadius = 7
                btnLive.clipsToBounds = true
                //btnLive.setImage(UIImage(named: "rightColorarr"), for: .normal)
                btnLive.backgroundColor = .red
                btnLive.setTitleColor(UIColor.white, for: .normal)
                btnLive.addTarget(self, action: #selector(self.btnLive), for: .touchUpInside)
                imgViewSplash.addSubview(btnLive)
                

                let btnEye = UIButton(frame: CGRect(x: (btnLive.frame.maxX+5) , y: 10, width: 80, height: 30))
                btnEye.setTitle("23K", for: .normal)
                btnEye.setTitleColor(UIColor.white, for: .normal)
                btnEye.setImage(UIImage(named: "greyEye"), for: .normal)
                btnEye.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 15)
                btnEye.titleEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
                imgViewSplash.addSubview(btnEye)
                
                let uiview = UIView()
                uiview.frame = CGRect(x: 0, y:imgViewSplash.frame.height-140, width: self.view.frame.size.width-20,height: 140)
                uiview.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.2)
                imgViewSplash.addSubview(uiview)
                                
                let titleLabel = UILabel()
                titleLabel.frame = CGRect(x: CGFloat(10), y: CGFloat(0), width: CGFloat(imgViewSplash.frame.size.width-20), height: CGFloat(35))
                titleLabel.text = "Deshi tech Shot"
                titleLabel.textColor = UIColor.white
                titleLabel.textAlignment = .left
                titleLabel.backgroundColor = UIColor.clear
                titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
                uiview.addSubview(titleLabel)

                let descriptionLabel = UILabel()
                descriptionLabel.frame = CGRect(x: CGFloat(8), y: CGFloat(titleLabel.frame.maxY-9), width: CGFloat(imgViewSplash.frame.size.width-16), height: CGFloat(80))
                descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna"
                descriptionLabel.textColor = UIColor.white
                descriptionLabel.textAlignment = .left
                descriptionLabel.numberOfLines = 3
                descriptionLabel.backgroundColor = UIColor.clear
                descriptionLabel.font =  UIFont(name: "Avenir-Light", size: 16.0)
                uiview.addSubview(descriptionLabel)
            }
            self.pageControl.frame = CGRect(x: 100, y: self.scrollViewWalk.frame.maxY + 1, width: self.scrollViewWalk.frame.width - 200, height: 30)
            self.pageControl.isUserInteractionEnabled = true
            self.pageControl.pageIndicatorTintColor = .lightGray
            self.pageControl.currentPageIndicatorTintColor = .black
            self.pageControl.tintColor = UIColor(red: 4.0 / 255.0, green: 202.0 / 255.0, blue:169.0 / 255.0, alpha: 1.0)
            self.pageControl.pageIndicatorTintColor = UIColor.red
            self.pageControl.currentPageIndicatorTintColor = UIColor(red: 4.0 / 255.0, green: 202.0 / 255.0, blue:169.0 / 255.0, alpha: 1.0)
            self.viewScrollBg.addSubview(self.pageControl)
        }
        self.scrollViewWalk.contentSize = CGSize(width: self.scrollViewWalk.frame.size.width * CGFloat(arraysplashImages.count), height: self.scrollViewWalk.frame.size.height-100)
        self.pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: .valueChanged)
        
//        let titleLabel = UILabel()
//        titleLabel.frame = CGRect(x: CGFloat(10), y: CGFloat(scrollViewWalk.frame.maxY+40), width: CGFloat(self.view.frame.size.width-60), height: CGFloat(35))
//        titleLabel.text = "Trending Videos"
//        titleLabel.textColor = UIColor.black
//        titleLabel.textAlignment = .left
//        titleLabel.backgroundColor = UIColor.clear
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 19.0)
//        self.viewScrollBg.addSubview(titleLabel)
//
//        let imgViewarrow = UIImageView()
//        imgViewarrow.frame = CGRect(x: CGFloat(titleLabel.frame.maxX+10), y: CGFloat(scrollViewWalk.frame.maxY+50), width: CGFloat(16), height: CGFloat(16))
//        imgViewarrow.backgroundColor = UIColor.clear
//        imgViewarrow.image = UIImage(named: "rightColorarr")
//        imgViewarrow.isUserInteractionEnabled = true
//        imgViewarrow.contentMode = .scaleAspectFill
//        imgViewarrow.clipsToBounds = true
//        //self.viewScrollBg.addSubview(imgViewarrow)
//
//        let nextArrow = UIButton(frame: CGRect(x: (titleLabel.frame.maxX+10), y: (scrollViewWalk.frame.maxY+50), width: 16, height: 16))
//        // button.setTitle("Email", for: .normal)
//        nextArrow.setImage(UIImage(named: "rightColorarr"), for: .normal)
//        nextArrow.backgroundColor = .clear
//        nextArrow.setTitleColor(UIColor.clear, for: .normal)
//        nextArrow.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
//      self.viewScrollBg.addSubview(nextArrow)
        
        arrayTitles = ["Trending Videos","Upcoming Shows","Product Categories", "Brands We Have", "qwr2 Videos"]
        uiShowUpBadges()
        tableViewServices.frame = CGRect(x: 0, y: self.scrollViewWalk.frame.maxY+25, width: screenWidth, height: screenHeight-(self.scrollViewWalk.frame.maxY+210))
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
        viewScrollBg.addSubview(tableViewServices)
        tableViewServices.isMultipleTouchEnabled = false
       
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
        return 200
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 
        return 200
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
        
        let imgViewarrow = UIImageView()
        imgViewarrow.frame = CGRect(x: CGFloat(heading.frame.width-40), y: CGFloat(10), width: CGFloat(16), height: CGFloat(16))
        imgViewarrow.backgroundColor = UIColor.clear
        imgViewarrow.image = UIImage(named: "rightColorarr")
        imgViewarrow.isUserInteractionEnabled = true
        imgViewarrow.contentMode = .scaleAspectFill
        imgViewarrow.clipsToBounds = true
        sectionHeader.addSubview(imgViewarrow)
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

            return cell!
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width:  CGFloat((screenWidth-20)/2.2) , height: 200)
     }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc func btnEye(sender : UIButton) {
                    //Write button action here
    }
    @objc func btnLive(sender : UIButton) {
                    //Write button action here
    }
    @objc func buttonTapped(sender : UIButton) {
                    //Write button action here
    }
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollViewWalk {
            if arrowBool == true {
               return
            }
            let pageWidth: CGFloat = scrollView.frame.size.width
            let page: Int = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
            kArrayNo = page
            pageControl.currentPage = page
//          btnNext.setTitle("Next", for:UIControlState())
//          btnNext.addTarget(self, action: #selector(LoginRegisterController.changePage(_:)), for: .touchUpInside)
            if kArrayNo == totalPage - 1 {
            } else {
               
            }
        } else {
//            let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
//            segment.selectedSegmentIndex = Int(pageNumber)
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        arrowBool = false
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        arrowBool = false
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * self.scrollViewWalk.frame.size.width
        kArrayNo = pageControl.currentPage
        self.scrollViewWalk.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    @objc func changePage(_ sender: UIButton?) {
        arrowBool = true
        let pageWidth: CGFloat = sender!.frame.size.width
        var page: Int = Int(floor((self.scrollViewWalk.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        print("totalPage: ", totalPage)
        print("kArrayNo: ", kArrayNo)
        if kArrayNo < totalPage - 1 {
            kArrayNo += 1
            if kArrayNo == totalPage - 1 {
                pageControl.currentPage = page
                page += 1
            }
        }
        if kArrayNo == totalPage-1 {
           
        } else {
        }
        var frame: CGRect = self.scrollViewWalk.frame
        frame.origin.x = screenWidth * CGFloat(kArrayNo)
        pageControl.currentPage = kArrayNo
        frame.origin.y = 0
        self.scrollViewWalk.setContentOffset(CGPoint(x: frame.origin.x, y: 0), animated: true)
    }
}
