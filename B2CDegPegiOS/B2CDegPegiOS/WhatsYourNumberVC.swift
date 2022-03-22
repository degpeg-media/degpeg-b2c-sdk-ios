//  WhatsYourNumberVC.swift
//  FleetCunsumerApp
//  Created by Apple on 12/29/21.

import UIKit
import FlagPhoneNumber

class WhatsYourNumberVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtFldMNumber: FPNTextField!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var codeBg: UIImageView!
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var txtFldPhoneNumber: UITextField!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var txtFldPassword: UITextField!
    var btnTermsConditions = UIButton()
    var btnSignUp = UIButton()
    var btnLogIn = UIButton()
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1.0)
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        
        viewBG1.layer.cornerRadius = 15
        viewBG2.layer.cornerRadius = 15
        viewBG3.layer.cornerRadius = 15
        viewBG4.layer.cornerRadius = 15
        viewBG5.layer.cornerRadius = 15
        txtFldMNumber.layer.cornerRadius = 15
        viewBG1.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        viewBG2.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        viewBG3.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        viewBG4.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        viewBG5.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        

        print(countryFlag(countryCode: "IN"))
        // imgLogo.image = UIImage(named: countryFlag(countryCode: "IN"))
        
        //txtFldMNumber.text =  countryFlag(countryCode: "IN")
        
        // To use your own flag icons, uncommment the line :
        // Bundle.FlagIcons = Bundle(for: SimpleViewController.self)

//      txtFldMNumber.borderStyle = .roundedRect
//      phoneNumberTextField.pickerView.showPhoneNumbers = false
        txtFldMNumber.displayMode = .list // .picker by default
        listController.setup(repository: txtFldMNumber.countryRepository)
        listController.didSelect = { [weak self] country in
            self?.txtFldMNumber.setFlag(countryCode: country.code)
            print("txtFld", self?.txtFldMNumber)
        }
        txtFldMNumber.delegate = self
        txtFldMNumber.font = UIFont.systemFont(ofSize: 18)
        // Custom the size/edgeInsets of the flag button
        txtFldMNumber.flagButtonSize = CGSize(width: 55, height: 55)
        txtFldMNumber.flagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        // Example of customizing the textField input accessory view
//        let items = [
//            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: nil),
//            UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
//            UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
//        ]
//        txtFldMNumber.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)
//        txtFldMNumber.hasPhoneNumberExample = true
//        txtFldMNumber.placeholder = "Phone Number"

        // Set the country list
        // phoneNumberTextField.setCountries(including: [.ES, .IT, .BE, .LU, .DE])
        // Exclude countries from the list
        // phoneNumberTextField.setCountries(excluding: [.AM, .BW, .BA])
        // Set the flag image with a region code
        txtFldMNumber.setFlag(countryCode: .IN)
        // Set the phone number directlyinR
        txtFldMNumber.set(phoneNumber: "")
       // view.addSubview(txtFldMNumber)
        txtFldMNumber.center = view.center
        
        self.btnTermsConditions = UIButton()
        self.btnTermsConditions.frame = CGRect(x:  24, y: CGFloat(viewBG5.frame.maxY+36), width: viewBG5.frame.width/2, height: 45)
        self.btnTermsConditions.setTitle("Terms & Conditions", for: .normal)
        self.btnTermsConditions.setTitleColor(UIColor.gray,for:.normal)
        self.btnTermsConditions.backgroundColor = .clear
        self.btnTermsConditions.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnTermsConditions.addTarget(self, action: #selector(self.btnTermsConditions(_:)), for: .touchUpInside)
        self.view.addSubview(self.btnTermsConditions)
        
        self.btnSignUp = UIButton()
        self.btnSignUp.frame = CGRect(x:  24 , y: CGFloat(btnTermsConditions.frame.maxY+20), width: self.view.frame.size.width - 48, height: 50)
        self.btnSignUp.setTitle("SignUp" , for: .normal)
        self.btnSignUp.setTitleColor(UIColor.white,for:.normal)
        self.btnSignUp.layer.cornerRadius = 5.0
        self.btnSignUp.backgroundColor = UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.btnSignUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnSignUp.layer.cornerRadius = 8.0
        self.btnSignUp.clipsToBounds = false
        self.btnSignUp.layer.shadowOpacity=0.25
        self.btnSignUp.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        self.btnSignUp.addTarget(self, action: #selector(self.clickbtnSignUp(_:)), for: .touchUpInside)
        self.view.addSubview(self.btnSignUp)
        
        let signUpLabel = UILabel()
        signUpLabel.frame = CGRect(x:self.view.frame.size.width/2-120, y: screenHeight-120, width: 180, height: CGFloat(20))
        signUpLabel.text = "Are you new to DegPeg?"
        signUpLabel.textColor = UIColor.black
        signUpLabel.textAlignment = .center
        signUpLabel.numberOfLines = 1
        signUpLabel.backgroundColor = UIColor.clear
        signUpLabel.font =  UIFont(name: "Avenir-Light", size: 16.0)
        self.view.addSubview(signUpLabel)

        self.btnLogIn = UIButton()
        self.btnLogIn.frame = CGRect(x:signUpLabel.frame.maxX-10, y: screenHeight-120, width: CGFloat(60), height: CGFloat(20))
        self.btnLogIn.setTitle("LogIn" , for: .normal)
        self.btnLogIn.setTitleColor(UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0),for:.normal)
        self.btnLogIn.layer.cornerRadius = 5.0
        self.btnLogIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnLogIn.addTarget(self, action: #selector(self.clickLogIn(_:)), for: .touchUpInside)
        self.view.addSubview(self.btnLogIn)
    }
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func btnNext(_ sender: Any) {
    }
    
    @objc func clickbtnSignUp(_ sender:AnyObject!) {
        
    }
    
    @objc func btnTermsConditions(_ sender:AnyObject!) {
        
    }
    
    @objc func clickLogIn(_ sender:AnyObject!) {
        
    }
    
    func countryFlag(countryCode: String) -> String {
      let base = 5
      var tempScalarView = String.UnicodeScalarView()
      for i in countryCode.utf16 {
        if let scalar = UnicodeScalar(base + Int(i)) {
          tempScalarView.append(scalar)
        }
      }
      return String(tempScalarView)
    }
    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()
        return toolbar
    }

    @objc func dismissCountries() {
        listController.dismiss(animated: true, completion: nil)
    }
}

extension WhatsYourNumberVC: FPNTextFieldDelegate {

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
//        textField.rightViewMode = .always
//        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))

//        print(
//            isValid,
//            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
//            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
//            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
//            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
//            textField.getRawPhoneNumber() ?? "Raw: nil"
//        )
    }

    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }


    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)

        listController.title = "Countries"
        listController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries))

        self.present(navigationViewController, animated: true, completion: nil)
    }
}
extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
