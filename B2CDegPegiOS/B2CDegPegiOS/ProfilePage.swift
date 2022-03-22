//
//  ProfilePage.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/15/22.
//

import UIKit
 
class ProfilePage: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    var newWindow : UIWindow?
    private var reachability:Reachability?
    let chatButton = UIButton()
    let notiButton = UIButton()
    let networkErrorButton = UIButton()
    @IBOutlet weak var profileTable: UITableView!
    var tabIndex = TabIndex.account

    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
 
   
    enum TableSection {
        static let profile: Int = 0
        static let myaccount = 1
        
        static let count = 2
    }
    
    var promoOptionssArray : [[String:String]]?
    var settingOptionsArray : [[String:String]]?
    var supportOptionArray : [[String:String]]?
    var popRatingWindow: UIWindow?
    var isUserLoggedIn = false
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Account"
        view.backgroundColor = .white
        newWindow = UIWindow()
        screenWidth = screenSize.width
        screenHeight = screenSize.height
//      populateContentArrays()
        uiShowUpBadges()
        registerNibs()
//        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.backButton(_:)))
//        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func backButton(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
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


    // MARK: - UI SetUp
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.count
    }
    
    func registerNibs() {
        profileTable.register(UINib(nibName: "HomeAccountCell", bundle: nil), forCellReuseIdentifier: "HomeAccountCell")
        profileTable.backgroundColor = .white
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == TableSection.profile {
            return 1
        } else if section == TableSection.myaccount {
            return 5
        }  else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == TableSection.myaccount {
            return "My Account"
        }  else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    var didReloadImageAfterLoading = false
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == TableSection.profile {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeAccountCell", for: indexPath) as! HomeAccountCell
            var nameString = ""
            var emailString = ""
            var balanceString = ""
            var userImageStr = ""
            cell.profileImage.image = UIImage(named: "profile")
            cell.infoLabel.text = "HI How Are You"
            cell.accessoryType = .disclosureIndicator
            return cell
        } else  {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "ProfileLogout")
            cell.imageView?.image = UIImage(named: "profile")
            cell.textLabel?.text = "Hello"
            cell.textLabel?.font = UIFont(name: (cell.textLabel?.font?.fontName)!, size: 16)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        if indexPath.section == TableSection.profile {
        } else if indexPath.section == TableSection.myaccount {
        }
    }

//    func populateContentArrays() {
//        promoOptionssArray = [
//            [
//                "title": "Refer & Earn".localized(using: Constants.bundleName.localize), /*Refer & Earn*/
//                "image": "refer_and_earn"
//            ],
//            [
//                "title": "Offers & Plans".localized(using: Constants.bundleName.localize),
//                "image": "offer_and_plans"
//            ],
//            [
//                "title": "Health Card".localized(using: Constants.bundleName.localize),
//                "image": "health_card"
//            ]
//        ]
//        settingOptionsArray = [
//            [
//                "title": "Update Basic Info".localized(using: Constants.bundleName.localize),
//                "image": "update_info"
//            ],
//            [
//                "title": "Update Someone Else's Info".localized(using: Constants.bundleName.localize),
//                "image": "someone_else_info"
//            ],
//            [
//                "title": "Corporate Plan".localized(using: Constants.bundleName.localize), //"Corporate Plan".diLocalized(using: Constants.bundleName.localize),
//                "image": "corporate"
//            ],
//            [
//                "title": "Payments".localized(using: Constants.bundleName.localize),
//                "image": "rupees_icon_purple"
//            ],
//            [
//                "title": "Change Password".localized(using: Constants.bundleName.localize),
//                "image": "update_password"
//            ],
//            [
//                "title": "Manage Address".localized(using: Constants.bundleName.localize),
//                "image": "ic_manage_address"
//            ],
//            [
//                "title": "Select Language".localized(using: Constants.bundleName.localize),
//                "image": "hindi-english-language"
//            ]
//        ]
//        supportOptionArray = [
//            [
//                "title": "Help & Support".localized(using: Constants.bundleName.localize), //"Help & Support",
//                "image": "help_support"
//            ],
//            [
//                "title":"Send Feedback".localized(using: Constants.bundleName.localize),
//                "image":"send_feedback"
//            ],
//            [
//                "title": "Rate Doctor Insta App".localized(using: Constants.bundleName.localize),
//                "image":"rate_us"
//            ],
//            [
//                "title": String(format: "App version : %@".diLocalized(using: Constants.bundleName.localize), "\(AppReleaseConstants.currentAppVersion)"), //"What's New".localized(using: Constants.bundleName.localize),
//                "image":"version_icon"
//            ]
//        ]
//    }
 
    // MARK: - Logout
    func handleLogout(withWindow window: UIWindow?) {
        //AppState.shared.signOut()
        logoutAndRemovedAppStorage()
        //showLogin(withWindow: window)business_id
    }
    
    func logoutAndRemovedAppStorage() {
    }


    //MARK: removePopupForError
    func removePopup() {
        popRatingWindow?.removeFromSuperview()
        popRatingWindow = nil
    }
}
