//
//  ViewController.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/14/22.

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var pageControl = UIPageControl()
    var nextButton: UIButton!
    var btnSkip = UIButton()
    var btnNext = UIButton()
    var viewScrollBg = UIView()
    var scrollViewWalk = UIScrollView()
    var kArrayNo: Int = 0
    var totalPage: Int = 0
    var arrowBool = false
    var arraysplashImages = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiWalkThrough()
    }
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    func uiWalkThrough() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        arraysplashImages = ["walk1", "walk2", "walk3"]
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        
        viewScrollBg = UIView()
        viewScrollBg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewScrollBg.backgroundColor = .white
        self.view.addSubview(viewScrollBg)
        
        scrollViewWalk = UIScrollView()
        scrollViewWalk.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 60)
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
               
                let imgViewLogo = UIImageView()
                imgViewLogo.frame = CGRect(x:(self.view.frame.size.width * CGFloat(index)) + self.view.frame.size.width/2-35 , y: 35, width: 70, height: 70)
                imgViewLogo.backgroundColor = UIColor.white
                imgViewLogo.image = UIImage(named: "logoImg")
                imgViewLogo.isUserInteractionEnabled = true
                imgViewLogo.contentMode = .scaleAspectFit
                imgViewLogo.clipsToBounds = true
                self.scrollViewWalk.addSubview(imgViewLogo)
                
                let imgViewArrow = UIImageView()
                imgViewArrow.frame = CGRect(x: (self.view.frame.size.width * CGFloat(index)) + self.view.frame.size.width-55 , y: 55, width: 30, height: 30)
                imgViewArrow.backgroundColor = UIColor.white
                imgViewArrow.image = UIImage(named: "rightArrow")
                imgViewArrow.isUserInteractionEnabled = true
                imgViewArrow.contentMode = .scaleAspectFit
                imgViewArrow.clipsToBounds = true
//                self.scrollViewWalk.addSubview(imgViewArrow)
                
                self.btnSkip = UIButton()
                self.btnSkip.frame = CGRect(x: (self.view.frame.size.width * CGFloat(index)) + self.view.frame.size.width-55 , y: 55, width: 30, height: 30)
                self.btnSkip.setImage(UIImage(named: "rightArrow"), for: .normal)
                self.btnSkip.backgroundColor = .clear
                self.btnSkip.addTarget(self, action: #selector(self.clickSkip(_:)), for: .touchUpInside)
                self.scrollViewWalk.addSubview(self.btnSkip)
                
                let imgViewSplash = UIImageView()
                imgViewSplash.frame = CGRect(x: (self.view.frame.size.width * CGFloat(index))+10, y: imgViewLogo.frame.maxY+2, width: self.view.frame.size.width-20,height: self.scrollViewWalk.frame.size.height-360)
                imgViewSplash.backgroundColor = UIColor.white
                let docImage = self.arraysplashImages[index]  as? String ?? ""
                print("docImage: %@", docImage)
                imgViewSplash.image = UIImage(named: docImage)
                imgViewSplash.isUserInteractionEnabled = true
                imgViewSplash.contentMode = .scaleAspectFit
                imgViewSplash.clipsToBounds = true
                self.scrollViewWalk.addSubview(imgViewSplash)
                
                let titleLabel = UILabel()
                titleLabel.frame = CGRect(x:(self.view.frame.size.width * CGFloat(index)) + CGFloat(10), y: CGFloat(imgViewSplash.frame.maxY ), width: CGFloat(self.view.frame.size.width-20), height: CGFloat(45))
                titleLabel.text = "Simplified Live Commerce"
                titleLabel.textColor = UIColor.black
                titleLabel.textAlignment = .center
                titleLabel.backgroundColor = UIColor.clear
                titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
                self.scrollViewWalk.addSubview(titleLabel)
                
                let descriptionLabel = UILabel()
                descriptionLabel.frame = CGRect(x:(self.view.frame.size.width * CGFloat(index)) + CGFloat(10), y: CGFloat(titleLabel.frame.maxY+10), width: CGFloat(self.view.frame.size.width-20), height: CGFloat(70))
                descriptionLabel.text = "Liverage the power of live commerce from phone"
                descriptionLabel.textColor = UIColor.darkGray
                descriptionLabel.textAlignment = .center
                descriptionLabel.numberOfLines = 3
                descriptionLabel.backgroundColor = UIColor.clear
                descriptionLabel.font =  UIFont(name: "Avenir-Light", size: 19.0)
                self.scrollViewWalk.addSubview(descriptionLabel)
            }
            self.pageControl.frame = CGRect(x: 100, y: self.scrollViewWalk.frame.maxY + 16, width: self.scrollViewWalk.frame.width - 200, height: 30)
            self.pageControl.isUserInteractionEnabled = true
            self.pageControl.pageIndicatorTintColor = .lightGray
            self.pageControl.currentPageIndicatorTintColor = .black
            self.pageControl.tintColor = UIColor(red: 4.0 / 255.0, green: 202.0 / 255.0, blue:169.0 / 255.0, alpha: 1.0)
            self.pageControl.pageIndicatorTintColor = UIColor.black
            self.pageControl.currentPageIndicatorTintColor = UIColor(red: 4.0 / 255.0, green: 202.0 / 255.0, blue:169.0 / 255.0, alpha: 1.0)
            self.viewScrollBg.addSubview(self.pageControl)
            
//            self.btnSkip = UIButton()
//            self.btnSkip.frame = CGRect(x: 10, y: self.pageControl.frame.maxY - 40, width: 80, height: 50)
//            self.btnSkip.setTitle("Skip" , for: .normal)
//            self.btnSkip.setTitleColor(UIColor.darkText, for: .normal)
//            self.btnSkip.layer.cornerRadius = 5.0
//            self.btnSkip.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
//            self.btnSkip.backgroundColor = .clear
//            self.btnSkip.addTarget(self, action: #selector(self.clickSkip(_:)), for: .touchUpInside)
//            self.viewScrollBg.addSubview(self.btnSkip)
            
            self.btnNext = UIButton()
            self.btnNext.frame = CGRect(x: self.viewScrollBg.frame.size.width - 90, y: self.pageControl.frame.maxY - 40, width: 80, height: 50)
            self.btnNext.setTitle("Next" , for: .normal)
            self.btnNext.setTitleColor(UIColor.darkText,for:.normal)
            self.btnNext.layer.cornerRadius = 5.0
            self.btnNext.backgroundColor = .clear
            self.btnNext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            self.btnNext.addTarget(self, action: #selector(self.changePage(_:)), for: .touchUpInside)
//            self.viewScrollBg.addSubview(self.btnNext)
        }
        self.scrollViewWalk.contentSize = CGSize(width: self.scrollViewWalk.frame.size.width * CGFloat(arraysplashImages.count), height: self.scrollViewWalk.frame.size.height)
        self.pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: .valueChanged)
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
              //btnNext.titleLabel?.text = "Done"
              btnNext.setTitle("Done" , for:.normal)
//            btnNext.addTarget(self, action: #selector(LoginRegisterController.clickDone(_:)),for: UIControlEvents.touchUpInside)
            } else {
                btnNext.setTitle("Next" , for:.normal)
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
        if kArrayNo == totalPage - 1 {
            btnNext.setTitle("Done" , for:.normal)
        } else {
            btnNext.setTitle("Next", for:.normal)
        }
        self.scrollViewWalk.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        var pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
//        pageControl.currentPage = Int(pageNumber)
//        if Int(pageNumber) == 0 {
//           kArrayNo = 0
//        }
//        if Int(pageNumber) < totalPage - 1 {
//            kArrayNo += 1
//            if Int(pageNumber) == totalPage - 1 {
//                pageControl.currentPage = Int(pageNumber)
//                pageNumber += 1
//            }
//        }
//        if Int(pageNumber) == totalPage-1 {
//            btnNext.setTitle("Done", for: UIControlState())
//        } else {
//            btnNext.setTitle("Next", for:UIControlState())
//        }
//    }
    
    //MARK: dismiss Popup view controller
    
    func dismissSelf() {
        dismiss(animated: false, completion: nil)
        view.removeFromSuperview()
        self.removeFromParent()
    }

    @objc func clickDone(_ sender: UIButton) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
          self.viewScrollBg.frame = CGRect(x: -self.screenWidth, y: 0, width: self.screenWidth, height: self.screenHeight)
          self.scrollViewWalk.isHidden = true
          self.pageControl.isHidden = true
          self.btnSkip.isHidden = true
          self.btnNext.isHidden = true
        })
    }
    
    @objc func changePage(_ sender: UIButton?) {
        arrowBool = true
        let pageWidth: CGFloat = sender!.frame.size.width
        var page: Int = Int(floor((self.scrollViewWalk.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        print("totalPage: ", totalPage)
        print("kArrayNo: ", kArrayNo)
        if btnNext.titleLabel?.text == "Done" {
            navigationController?.setNavigationBarHidden(false, animated: false)
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.viewScrollBg.frame = CGRect(x:-self.screenWidth, y: 0, width: self.screenWidth, height: self.screenHeight)
                self.scrollViewWalk.isHidden = true
                self.pageControl.isHidden = true
                self.btnSkip.isHidden = true
                self.btnNext.isHidden = true
            })
        } else {
            if kArrayNo < totalPage - 1 {
                kArrayNo += 1
                if kArrayNo == totalPage - 1 {
                    pageControl.currentPage = page
                    page += 1
                }
            }
            if kArrayNo == totalPage-1 {
                btnNext.setTitle("Done", for: .normal)
            } else {
                btnNext.setTitle("Next", for: .normal)
            }
            var frame: CGRect = self.scrollViewWalk.frame
            frame.origin.x = screenWidth * CGFloat(kArrayNo)
            pageControl.currentPage = kArrayNo
            frame.origin.y = 0
            self.scrollViewWalk.setContentOffset(CGPoint(x: frame.origin.x, y: 0), animated: true)
        }
    }
  
    @objc func clickSkip(_ sender:AnyObject!) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.viewScrollBg.frame = CGRect(x:-self.screenWidth, y: 0, width: self.screenWidth, height: self.screenHeight)
            self.scrollViewWalk.isHidden = true
            self.pageControl.isHidden = true
            self.btnSkip.isHidden = true
            self.btnNext.isHidden = true
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            self.navigationItem.backBarButtonItem = backItem
            self.navigationController?.setNavigationBarHidden(true,animated:false)
            let storyboard1 = UIStoryboard(name:"Hometabs",bundle:Bundle.main)
            let homeTabViewController = storyboard1.instantiateViewController(withIdentifier: "HomeParentViewController") as! HomeParentViewController;
//            homeTabViewController.rateSchedudeInfo = rateSchedudeInfo
//            homeTabViewController.isContinueOffline = false
//            homeTabViewController.selectedIndex = TabIndex.home
//            homeTabViewController.navigationController?.isNavigationBarHidden = true
//            homeTabViewController.navigationItem.hidesBackButton = true
         
            self.navigationController?.show(homeTabViewController, sender: self)
        })
    }

}

