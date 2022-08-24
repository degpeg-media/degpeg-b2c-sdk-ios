//
//  ViewController.swift
//  B2CSDK
//
//  Created by Raj Kadam on 05/17/2022.
//  Copyright (c) 2022 Raj Kadam. All rights reserved.
//

import UIKit
import B2CSDK
class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getFrameworkRootVc() {

        //let manager1 = DegpegManager.init(key: "1234", userId: "6278c4556cb38a7a9c10df6e", userName: "Raj Kadam", influencerID: "6278c4546cb38a7a9c10df6d")
        let publisherId = "6007cf41f2895e2eabcc2ac2"
        let manager = DegpegManager.init(appID: "", secret: "", userId: "", userName: "", influencerID: "", role: .publisher, publisherID: publisherId, providerID: nil)
        if let vc = manager.getRootViewController() {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }

}

class ViewController: UIViewController {

    @IBOutlet var viewTitle: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var viewProfile: UIView!
    @IBOutlet var imageViewProfile: UIImageView!
    @IBOutlet var collectionViewSlider: UICollectionView!
    @IBOutlet var collectionViewCategories: UICollectionView!
    @IBOutlet var layoutConstraintCategoriesHeight: NSLayoutConstraint!
    @IBOutlet var collectionViewDiscounts: UICollectionView!
    @IBOutlet var layoutConstraintDiscountsHeight: NSLayoutConstraint!

    private var sliderVisibleIndex = IndexPath(item: 0, section: 0)
    private var categories: [String] = []
    private var products: [[String: String]] = []

    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    
    //Custom pop up
    @IBOutlet weak var customPopup: UIView!
    @IBOutlet weak var textAppID: UITextField!
    @IBOutlet weak var textSecret: UITextField!
    @IBOutlet weak var textUserName: UITextField!
    @IBOutlet weak var textPublisherIDOrProviderID: UITextField!
    @IBOutlet weak var publisherOrProviderSwitch: UISwitch!
    @IBOutlet weak var labelSDKFor: UILabel!
    var selectedRole: UserRoles = .publisher
    override func viewDidLoad() {

        super.viewDidLoad()
        initialConfiguration()
        let appId = "degpegdegpeg _mediaXuUwyvni"
        let secretKey = "Nnra8P2iGqT2uJFU"
        let publisherId = "6007cf41f2895e2eabcc2ac2"
        
        textAppID.text = appId
        textSecret.text = secretKey
        textUserName.text = "Raj Kadam"
        publisherOrProviderSwitch.isOn = true
        labelSDKFor.text = "SDK For Publisher"
        textPublisherIDOrProviderID.text = publisherId
       
    }
    
    @IBAction func switchVAlueChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            labelSDKFor.text = "SDK For Publisher"
            selectedRole = .publisher
        }else{
            labelSDKFor.text = "SDK For Provider"
            selectedRole = .provider
        }
    }
    func initialConfiguration(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewTitle)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewProfile)

        collectionViewSlider.register(UINib(nibName: "Home2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell1")
        collectionViewCategories.register(UINib(nibName: "Home2Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell2")
        collectionViewDiscounts.register(UINib(nibName: "Home2Cell3", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell3")

        let cellWidth = UIScreen.main.bounds.width - 100
        let sectionSpacing = CGFloat(50)
        let cellSpacing = CGFloat(15)

        if let layout = collectionViewSlider.collectionViewLayout as? Home2PagingCollectionViewLayout {
            layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
            layout.itemSize = CGSize(width: cellWidth, height: collectionViewSlider.frame.size.height)
            layout.minimumLineSpacing = cellSpacing
            collectionViewSlider.collectionViewLayout = layout
            collectionViewSlider.translatesAutoresizingMaskIntoConstraints = false
            collectionViewSlider.decelerationRate = .fast
        }

        loadData()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewWillLayoutSubviews() {

        super.viewWillLayoutSubviews()

        layoutConstraintCategoriesHeight.constant = collectionViewCategories.contentSize.height
        layoutConstraintDiscountsHeight.constant = collectionViewDiscounts.contentSize.height
    }

    // MARK: - Data methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {

        imageView.image = UIImage.init(named: "degpeg")
        labelTitle.text = "Degpeg SDK Demo"
        imageViewProfile.image = UIImage.init(named: "profile")//sample("Social", "Portraits", 7)

        categories.removeAll()
        products.removeAll()

        categories.append("Shoes")
        categories.append("Shirts")
        categories.append("Watches")
        categories.append("Jeans")

        var dict1: [String: String] = [:]
        dict1["title"] = "Suede Chukka Boots"
        dict1["brand"] = "River Island"
        dict1["price"] = "$79.00"
        dict1["originalPrice"] = ""
        products.append(dict1)

        var dict2: [String: String] = [:]
        dict2["title"] = "Platform Derby Shoes"
        dict2["brand"] = "Stella McCartney"
        dict2["price"] = "$384"
        dict2["originalPrice"] = "$640"
        products.append(dict2)

        var dict3: [String: String] = [:]
        dict3["title"] = "Hiking boots"
        dict3["brand"] = "Dolce & Gabbana"
        dict3["price"] = "$59"
        dict3["originalPrice"] = "$70"
        products.append(dict3)

        var dict4: [String: String] = [:]
        dict4["title"] = "Motocross boots"
        dict4["brand"] = "Hermes"
        dict4["price"] = "$48"
        dict4["originalPrice"] = ""
        products.append(dict4)

        var dict5: [String: String] = [:]
        dict5["title"] = "Riding boots"
        dict5["brand"] = "Armani"
        dict5["price"] = "$98"
        dict5["originalPrice"] = ""
        products.append(dict5)

        var dict6: [String: String] = [:]
        dict6["title"] = "Jodhpur Boots"
        dict6["brand"] = "House of Versace"
        dict6["price"] = "$75"
        dict6["originalPrice"] = "$97"
        products.append(dict6)

        refreshCollectionViewSlider()
        refreshCollectionViewCategories()
        refreshCollectionViewDiscounts()
    }

    // MARK: - Refresh methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshCollectionViewSlider() {

        collectionViewSlider.reloadData()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshCollectionViewCategories() {

        collectionViewCategories.reloadData()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshCollectionViewDiscounts() {

        collectionViewDiscounts.reloadData()
    }
    
    
    func openSDK(){
        
        
        // 1. app id
        // 2. content publisher Id / content prover id
        // 3. app secret
        //
        
        let appId = textAppID.text ?? "degpegdegpeg _mediaXuUwyvni"
        let secretKey = textSecret.text ?? "Nnra8P2iGqT2uJFU"
        var publisherId:String? = nil
        var providerID: String? = nil
        if selectedRole == .publisher {
            publisherId = textPublisherIDOrProviderID.text ?? "6007cf41f2895e2eabcc2ac2"
        }else{
            providerID = textPublisherIDOrProviderID.text ?? "6007cf41f2895e2eabcc2ac2"
        }
        let userName = textUserName.text ?? "Raj Kadam"
//        "appId": "degpegdegpeg _mediaXuUwyvni",
//                "secretKey": "Nnra8P2iGqT2uJFU",
        let manager = DegpegManager.init(appID: appId, secret: secretKey, userId: "6278c4556cb38a7a9c10df6e", userName:userName, influencerID: "6278c4546cb38a7a9c10df6d", role: selectedRole, publisherID: publisherId, providerID: providerID) //DegpegManager.init(key: "1234", userId: "6278c4556cb38a7a9c10df6e", userName: "Raj Kadam", influencerID: "6278c4546cb38a7a9c10df6d")
        if let vc = manager.getRootViewController() {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func getSDKRootController(){
        // 1. app id
        // 2. content publisher Id / content prover id
        // 3. app secret
        //
        let appId = "degpegdegpeg _mediaXuUwyvni"
        let secretKey = "Nnra8P2iGqT2uJFU"
        let publisherId = "6007cf41f2895e2eabcc2ac2"
        let manager = DegpegManager.init(appID: appId, secret: secretKey, userId: "6278c4556cb38a7a9c10df6e", userName: "Raj Kadam", influencerID: "6278c4546cb38a7a9c10df6d", role: .publisher, publisherID: publisherId, providerID: nil)
        if let vc = manager.getRootViewController() {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }

    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionProfile(_ sender: UIButton) {
        print(#function)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.customPopup.isHidden = false
            self.view.layoutIfNeeded()
        } completion: { flag in
            
        }

    }
    @IBAction func hideCustomization(_ sender: UIButton) {
        print(#function)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.customPopup.isHidden = true
            self.view.layoutIfNeeded()
        } completion: { flag in
            
        }

    }
    
    @IBAction func actionDegpegSDKDemo(_ sender: UIButton) {
        print(#function)
        openSDK()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @objc func actionDiscountsMore(_ sender: UIButton) {

        print(#function)
        dismiss(animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionSeeAllCategories(_ sender: UIButton) {

        print(#function)
        dismiss(animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionSeeAllDiscounts(_ sender: UIButton) {

        print(#function)
        dismiss(animated: true)
    }
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ViewController: UICollectionViewDataSource {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if (collectionView == collectionViewSlider)        { return 10 }
        if (collectionView == collectionViewCategories)    { return 4 }
        if (collectionView == collectionViewDiscounts)    { return 6 }

        return 0
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if (collectionView == collectionViewSlider) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell1", for: indexPath) as! Home2Cell1
            cell.bindData(index: indexPath.item)
            return cell
        }

        if (collectionView == collectionViewCategories) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell2", for: indexPath) as! Home2Cell2
            cell.bindData(category: categories[indexPath.row])
            return cell
        }

        if (collectionView == collectionViewDiscounts) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell3", for: indexPath) as! Home2Cell3
            cell.bindData(index: indexPath.item, data: products[indexPath.row])
            cell.buttonMore.tag = indexPath.row
            cell.buttonMore.addTarget(self, action: #selector(actionDiscountsMore(_:)), for: .touchUpInside)
            return cell
        }

        return UICollectionViewCell()
    }
    
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ViewController: UICollectionViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(#function)
        if (collectionView == collectionViewSlider) {
            openSDK()
        }
        if (collectionView == collectionViewCategories) { }
        if (collectionView == collectionViewDiscounts) { }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ViewController: UICollectionViewDelegateFlowLayout {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        let categoriesCellWidth = (width-15)/2

        if (collectionView == collectionViewSlider) { return CGSize(width: width-100, height: height) }
        if (collectionView == collectionViewCategories) { return CGSize(width: categoriesCellWidth, height: 40) }
        if (collectionView == collectionViewDiscounts) { return CGSize(width: categoriesCellWidth, height: categoriesCellWidth+30) }

        return CGSize.zero
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        if (collectionView == collectionViewSlider) { return 15 }
        if (collectionView == collectionViewCategories) { return 15 }
        if (collectionView == collectionViewDiscounts) { return 15 }

        return 0
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        if (collectionView == collectionViewSlider) { return 15 }
        if (collectionView == collectionViewCategories) { return 15 }
        if (collectionView == collectionViewDiscounts) { return 15 }

        return 0
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if (collectionView == collectionViewSlider) { return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50) }
        if (collectionView == collectionViewCategories) { return UIEdgeInsets.zero }
        if (collectionView == collectionViewDiscounts) { return UIEdgeInsets.zero }

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ViewController: UIScrollViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

    }
}
