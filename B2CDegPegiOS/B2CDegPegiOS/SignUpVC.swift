//
//  SignUpVC.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/21/22.
//

import UIKit
import FlagPhoneNumber

class SignUpVC:  UIViewController, UITextFieldDelegate {
    var viewScrollBg = UIView()
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var btnLogin = UIButton()
    var txtFld_Email:UITextField!
    var txtfldName:UITextField!
    var txtFld_Number:UITextField!
    var txtfldPhone:FPNTextField!
    var txtFld_Pwd:UITextField!
    var txtFld_NewPwd:UITextField!
    var txtFld_ReEntrNewPwd:UITextField!
    var btnEye: UIButton!
    var btnTermsConditions = UIButton()
    var btnSignUp = UIButton()
    var btnLogIn = UIButton()
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)

    enum controllerTags {
        static let currentPwd = 200
        static let enterNewPwd = 201
        static let reEnterNewPwd = 202
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        
        viewScrollBg = UIView()
        viewScrollBg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewScrollBg.backgroundColor = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1.0)
        self.view.addSubview(viewScrollBg)
        
        let imgViewLogo = UIImageView()
        imgViewLogo.frame = CGRect(x: self.view.frame.size.width/2-60 , y: 60, width: 120, height: 50)
        imgViewLogo.backgroundColor = UIColor.white
        imgViewLogo.image = UIImage(named: "degpeg-logo")
        imgViewLogo.isUserInteractionEnabled = true
        imgViewLogo.contentMode = .scaleAspectFit
        imgViewLogo.clipsToBounds = true
        self.viewScrollBg.addSubview(imgViewLogo)
        
        let descriptionLabel = UILabel()
        descriptionLabel.frame = CGRect(x:self.view.frame.size.width/2-70, y: CGFloat(imgViewLogo.frame.maxY), width: CGFloat(imgViewLogo.frame.size.width), height: CGFloat(20))
        descriptionLabel.text = "# Livecommerce"
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 1
        descriptionLabel.backgroundColor = UIColor.clear
        descriptionLabel.font =  UIFont(name: "Avenir-Light", size: 16.0)
        self.viewScrollBg.addSubview(descriptionLabel)

        let paddingView_CurrentPwd:UIView=UIView()
        paddingView_CurrentPwd.frame=CGRect(x: 0,y: 0,width: 5,height: 10)
        
        let paddingRightView_CurrentPwd:UIView=UIView()
        paddingRightView_CurrentPwd.frame=CGRect(x: 0,y: 0,width: 40,height: 50)
        
        let paddingView_Name:UIView=UIView()
        paddingView_Name.frame=CGRect(x: 0,y: 0,width: 5,height: 10)
        
        let paddingRightName:UIView=UIView()
        paddingRightName.frame=CGRect(x: 0,y: 0,width: 20,height: 20)
        
        txtfldName = UITextField()
        txtfldName.frame = CGRect(x: 24,y: descriptionLabel.frame.maxY+45,width: screenWidth-48,height: 50)
        txtfldName.delegate = self
        txtfldName.textColor = UIColor.black
        txtfldName.leftView = paddingView_Name
        txtfldName.rightView = paddingRightName
        txtfldName.placeholder = "Name"
        txtfldName.tintColor = UIColor.black;
        txtfldName.font = UIFont(name:"Arial",size:16.0)
        txtfldName.backgroundColor = UIColor.white
        txtfldName.layer.cornerRadius = 8.0
        txtfldName.isSecureTextEntry = true
        txtfldName.leftViewMode = .always
        txtfldName.rightViewMode = .always
        txtfldName.tag = 100
        txtfldName.returnKeyType = .next
        txtfldName.keyboardType = UIKeyboardType.asciiCapable
        txtfldName.layer.cornerRadius = 8.0
        txtfldName.clipsToBounds = false
        txtfldName.layer.shadowOpacity=0.25
        txtfldName.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        self.viewScrollBg.addSubview(txtfldName)
        
        let paddingView_Email:UIView=UIView()
        paddingView_Email.frame=CGRect(x: 0,y: 0,width: 5,height: 10)
        
        let paddingRightView_Email:UIView=UIView()
        paddingRightView_Email.frame=CGRect(x: 0,y: 0,width: 40,height: 50)
        txtFld_Email = UITextField()
        txtFld_Email.frame = CGRect(x: 24,y: txtfldName.frame.maxY+25,width: screenWidth-48,height: 50)
        txtFld_Email.delegate = self
        txtFld_Email.textColor = UIColor.black
        txtFld_Email.leftView = paddingView_Email
        txtFld_Email.rightView = paddingRightView_Email
        txtFld_Email.placeholder = "Email"
        txtFld_Email.tintColor = UIColor.black;
        txtFld_Email.font = UIFont(name:"Arial",size:16.0)
        txtFld_Email.backgroundColor = UIColor.white
        txtFld_Email.layer.cornerRadius = 8.0
        txtFld_Email.isSecureTextEntry = true
        txtFld_Email.leftViewMode = .always
        txtFld_Email.rightViewMode = .always
        txtFld_Email.tag = 100
        txtFld_Email.returnKeyType = .next
        txtFld_Email.keyboardType = UIKeyboardType.asciiCapable
        self.viewScrollBg.addSubview(txtFld_Email)

        let paddingView_Number:UIView=UIView()
        paddingView_Number.frame=CGRect(x: 0,y: 0,width: 5,height: 10)
        
        let paddingRightView_Number:UIView=UIView()
        paddingRightView_Number.frame=CGRect(x: 0,y: 0,width: 40,height: 50)
        txtFld_Number = UITextField()
        txtFld_Number.frame = CGRect(x: 24,y: txtFld_Email.frame.maxY+25,width:80,height: 50)
        txtFld_Number.delegate = self
        txtFld_Number.textColor = UIColor.black
        txtFld_Number.leftView = paddingView_Number
        txtFld_Number.rightView = paddingRightView_Number
        txtFld_Number.placeholder = "+91"
        txtFld_Number.tintColor = UIColor.black;
        txtFld_Number.font = UIFont(name:"Arial",size:16.0)
        txtFld_Number.backgroundColor = UIColor.white
        txtFld_Number.layer.cornerRadius = 8.0
        txtFld_Number.isSecureTextEntry = true
        txtFld_Number.leftViewMode = .always
        txtFld_Number.rightViewMode = .always
        txtFld_Number.tag = 100
        txtFld_Number.returnKeyType = .next
        txtFld_Number.keyboardType = UIKeyboardType.asciiCapable
        self.viewScrollBg.addSubview(txtFld_Number)
        
        let paddingView_Phone:UIView=UIView()
        paddingView_Phone.frame=CGRect(x: 0,y: 0,width: 5,height: 10)
        
        let paddingRightPhone:UIView=UIView()
        paddingRightPhone.frame=CGRect(x: 0,y: 0,width: 20,height: 20)
        
        txtfldPhone = FPNTextField()
        txtfldPhone.frame = CGRect(x: txtFld_Number.frame.maxX+20,y: txtFld_Email.frame.maxY+25,width:240,height: 50)
        txtfldPhone.delegate = self
        txtfldPhone.textColor = UIColor.black
        txtfldPhone.leftView = paddingView_Phone
        txtfldPhone.rightView = paddingRightPhone
        txtfldPhone.placeholder = "Phone"
        txtfldPhone.tintColor = UIColor.black;
        txtfldPhone.font = UIFont(name:"Arial",size:16.0)
        txtfldPhone.backgroundColor = UIColor.white
        txtfldPhone.layer.cornerRadius = 8.0
        txtfldPhone.isSecureTextEntry = false
        txtfldPhone.leftViewMode = .always
        txtfldPhone.rightViewMode = .always
        txtfldPhone.tag = 100
        txtfldPhone.returnKeyType = .next
        txtfldPhone.keyboardType = UIKeyboardType.asciiCapable
        txtfldPhone.layer.cornerRadius = 8.0
        txtfldPhone.clipsToBounds = false
        txtfldPhone.layer.shadowOpacity=0.25
        txtfldPhone.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        self.viewScrollBg.addSubview(txtfldPhone)
        
        print(countryFlag(countryCode: "IN"))
        
        txtFld_Pwd = UITextField()
        txtFld_Pwd.frame = CGRect(x: 24,y: txtFld_Number.frame.maxY+85,width: screenWidth-48,height: 50)
        txtFld_Pwd.delegate = self
        txtFld_Pwd.textColor = UIColor.black
        txtFld_Pwd.leftView = paddingView_CurrentPwd
        txtFld_Pwd.rightView = paddingRightView_CurrentPwd
        txtFld_Pwd.placeholder = "Password"
        txtFld_Pwd.tintColor = UIColor.black;
        txtFld_Pwd.font = UIFont(name:"Arial",size:16.0)
        txtFld_Pwd.backgroundColor = UIColor.white
        txtFld_Pwd.layer.cornerRadius = 8.0
        txtFld_Pwd.isSecureTextEntry = true
        txtFld_Pwd.leftViewMode = .always
        txtFld_Pwd.rightViewMode = .always
        txtFld_Pwd.tag = 100
        txtFld_Pwd.returnKeyType = .next
        txtFld_Pwd.keyboardType = UIKeyboardType.asciiCapable
        
        let dropdownButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: txtFld_Pwd.frame.height))
        dropdownButton.backgroundColor = .clear
        dropdownButton.setImage(UIImage(named: "greyEye"), for: UIControl.State())
        let container = UIView(frame: dropdownButton.frame)
        container.backgroundColor = .clear
        container.addSubview(dropdownButton)
        dropdownButton.tag = controllerTags.currentPwd
        dropdownButton.addTarget(self, action:#selector(self.toggleBtn(_:)), for: .touchUpInside)
        txtFld_Pwd.rightView = container
        txtFld_Pwd.rightViewMode = .always
        self.viewScrollBg.addSubview(txtFld_Pwd)
        txtFld_Pwd.layer.cornerRadius = 10.0
        txtFld_Pwd.clipsToBounds = false
        txtFld_Pwd.layer.shadowOpacity=0.25
        txtFld_Pwd.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        
        self.btnTermsConditions = UIButton()
        self.btnTermsConditions.frame = CGRect(x:  24, y: CGFloat(txtFld_Pwd.frame.maxY+6), width: txtFld_Pwd.frame.width/2, height: 45)
        self.btnTermsConditions.setTitle("Terms & Conditions", for: .normal)
        self.btnTermsConditions.setTitleColor(UIColor.gray,for:.normal)
        self.btnTermsConditions.backgroundColor = .clear
        self.btnTermsConditions.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnTermsConditions.addTarget(self, action: #selector(self.btnTermsConditions(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnTermsConditions)
        
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
        self.viewScrollBg.addSubview(self.btnSignUp)
        
        let signUpLabel = UILabel()
        signUpLabel.frame = CGRect(x:self.view.frame.size.width/2-120, y: screenHeight-120, width: 180, height: CGFloat(20))
        signUpLabel.text = "Are you new to DegPeg?"
        signUpLabel.textColor = UIColor.black
        signUpLabel.textAlignment = .center
        signUpLabel.numberOfLines = 1
        signUpLabel.backgroundColor = UIColor.clear
        signUpLabel.font =  UIFont(name: "Avenir-Light", size: 16.0)
        self.viewScrollBg.addSubview(signUpLabel)

        self.btnLogIn = UIButton()
        self.btnLogIn.frame = CGRect(x:signUpLabel.frame.maxX-10, y: screenHeight-120, width: CGFloat(60), height: CGFloat(20))
        self.btnLogIn.setTitle("LogIn" , for: .normal)
        self.btnLogIn.setTitleColor(UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0),for:.normal)
        self.btnLogIn.layer.cornerRadius = 5.0
        self.btnLogIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnLogIn.addTarget(self, action: #selector(self.clickLogIn(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnLogIn)
        
        
//        txtfldPhone.displayMode = .list // .picker by default
//
//        listController.setup(repository: txtfldPhone.countryRepository)
//
//        listController.didSelect = { [weak self] country in
//            self?.txtfldPhone.setFlag(countryCode: country.code)
//        }
//        txtfldPhone.delegate = self
//        txtfldPhone.font = UIFont.systemFont(ofSize: 18)
//        // Custom the size/edgeInsets of the flag button
//        txtfldPhone.flagButtonSize = CGSize(width: 55, height: 55)
//        txtfldPhone.flagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        // Example of customizing the textField input accessory view
//        let items = [
//            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: nil),
//            UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
//            UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
//        ]
//        txtfldPhone.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)
//        txtfldPhone.hasPhoneNumberExample = true
////        txtFldMNumber.placeholder = "Phone Number"
//
//        // Set the country list
//        // phoneNumberTextField.setCountries(including: [.ES, .IT, .BE, .LU, .DE])
//        // Exclude countries from the list
//        // phoneNumberTextField.setCountries(excluding: [.AM, .BW, .BA])
//        // Set the flag image with a region code
//        txtfldPhone.setFlag(countryCode: .IN)
//        // Set the phone number directlyinR
//        txtfldPhone.set(phoneNumber: "9140876657")
//       // view.addSubview(txtFldMNumber)
//        txtfldPhone.center = view.center
        
        
        txtfldPhone.displayMode = .list // .picker by default

        listController.setup(repository: txtfldPhone.countryRepository)

        listController.didSelect = { [weak self] country in
            self?.txtfldPhone.setFlag(countryCode: country.code)
        }
        txtfldPhone.delegate = self
        txtfldPhone.font = UIFont.systemFont(ofSize: 18)
        // Custom the size/edgeInsets of the flag button
        txtfldPhone.flagButtonSize = CGSize(width: 55, height: 55)
        txtfldPhone.flagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        // Example of customizing the textField input accessory view
        let items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: nil),
            UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
            UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
        ]
        txtfldPhone.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)
        txtfldPhone.hasPhoneNumberExample = true
//        txtFldMNumber.placeholder = "Phone Number"

        // Set the country list
        // phoneNumberTextField.setCountries(including: [.ES, .IT, .BE, .LU, .DE])
        // Exclude countries from the list
        // phoneNumberTextField.setCountries(excluding: [.AM, .BW, .BA])
        // Set the flag image with a region code
        txtfldPhone.setFlag(countryCode: .IN)
        // Set the phone number directlyinR
        txtfldPhone.set(phoneNumber: "9140876657")
       // view.addSubview(txtFldMNumber)
        txtfldPhone.center = view.center
       
    }
    
    //MARK: toggleBtn Action
    @objc func toggleBtn(_ sender: UIButton!) {
        if sender.isSelected == true {
            sender.isSelected = false
            if sender.tag == controllerTags.currentPwd {
                sender.setImage(UIImage(named: "greyEye")!, for: .normal);
                txtFld_Pwd.isSecureTextEntry = true
            } else if sender.tag == controllerTags.enterNewPwd {
                txtFld_NewPwd.isSecureTextEntry = true
                sender.setImage(UIImage(named: "greyEye")!, for: .normal);
            } else if sender.tag == controllerTags.reEnterNewPwd {
                txtFld_ReEntrNewPwd.isSecureTextEntry = true
                sender.setImage(UIImage(named: "greyEye")!, for: .normal);
            }
        } else {
            sender.isSelected = true
            if sender.tag == controllerTags.currentPwd {
                txtFld_Pwd.isSecureTextEntry = false
                sender.setImage(UIImage(named: "color")!, for: .normal);
            } else if sender.tag == controllerTags.enterNewPwd {
                txtFld_NewPwd.isSecureTextEntry = false
                sender.setImage(UIImage(named: "color")!, for: .normal);
            } else if sender.tag == controllerTags.reEnterNewPwd {
                txtFld_ReEntrNewPwd.isSecureTextEntry = false
                sender.setImage(UIImage(named: "color")!, for: .normal);
            }
        }
    }
    
    @objc func clickbtnSignUp(_ sender:AnyObject!) {
        
    }
    
    @objc func btnTermsConditions(_ sender:AnyObject!) {
        
    }
    
    @objc func clickLogIn(_ sender:AnyObject!) {
        
    }
    
    func countryFlag(countryCode: String) -> String {
        let base = 127397
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

  extension SignUpVC: FPNTextFieldDelegate {

      func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
  //        textField.rightViewMode = .always
  //        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))

          print(
              isValid,
              textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
              textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
              textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
              textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
              textField.getRawPhoneNumber() ?? "Raw: nil"
          )
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
