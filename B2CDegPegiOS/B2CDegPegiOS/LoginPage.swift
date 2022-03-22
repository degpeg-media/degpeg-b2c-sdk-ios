//  LoginPage.swift
//  B2CDegPegiOS
//  Created by Apple on 3/14/22.

import UIKit

class LoginPage: UIViewController, UITextFieldDelegate {
    var viewScrollBg = UIView()
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var btnLogin = UIButton()
    
    var txtFld_Email:UITextField!
    var txtFld_Pwd:UITextField!
    var txtFld_NewPwd:UITextField!
    var txtFld_ReEntrNewPwd:UITextField!
    var btnEye: UIButton!
    var btnForgotPwd = UIButton()
    var btnSkip = UIButton()
    var btnSignUp = UIButton()
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
        
        let paddingView_email:UIView=UIView()
        paddingView_email.frame=CGRect(x: 0,y: 0,width: 5,height: 10)
        
        let paddingRightemail:UIView=UIView()
        paddingRightemail.frame=CGRect(x: 0,y: 0,width: 20,height: 20)
        
        txtFld_Email = UITextField()
        txtFld_Email.frame = CGRect(x: 24,y: descriptionLabel.frame.maxY+45,width: screenWidth-48,height: 50)
        txtFld_Email.delegate = self
        txtFld_Email.textColor = UIColor.black
        txtFld_Email.leftView = paddingView_email
        txtFld_Email.rightView = paddingRightemail
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
        txtFld_Email.layer.cornerRadius = 8.0
        txtFld_Email.clipsToBounds = false
        txtFld_Email.layer.shadowOpacity=0.25
        txtFld_Email.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        self.viewScrollBg.addSubview(txtFld_Email)
        
        txtFld_Pwd = UITextField()
        txtFld_Pwd.frame = CGRect(x: 24,y: txtFld_Email.frame.maxY+25,width: screenWidth-48,height: 50)
        txtFld_Pwd.delegate = self
        txtFld_Pwd.textColor = UIColor.black
        txtFld_Pwd.leftView = paddingView_CurrentPwd
        txtFld_Pwd.rightView = paddingRightView_CurrentPwd
        txtFld_Pwd.placeholder = "Current Password*"
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
        
        self.btnForgotPwd = UIButton()
        self.btnForgotPwd.frame = CGRect(x:  txtFld_Pwd.frame.maxX-(txtFld_Pwd.frame.width/2), y: CGFloat(txtFld_Pwd.frame.maxY+6), width: txtFld_Pwd.frame.width/2, height: 45)
        self.btnForgotPwd.setTitle("Forgot Password?", for: .normal)
        self.btnForgotPwd.setTitleColor(UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0),for:.normal)
        self.btnForgotPwd.backgroundColor = .clear
        self.btnForgotPwd.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnForgotPwd.addTarget(self, action: #selector(self.clickForgot(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnForgotPwd)
        
        self.btnLogin = UIButton()
        self.btnLogin.frame = CGRect(x:  24 , y: CGFloat(btnForgotPwd.frame.maxY+20), width: self.view.frame.size.width - 48, height: 50)
        self.btnLogin.setTitle("Login" , for: .normal)
        self.btnLogin.setTitleColor(UIColor.white,for:.normal)
        self.btnLogin.layer.cornerRadius = 5.0
        self.btnLogin.backgroundColor = UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.btnLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnLogin.layer.cornerRadius = 8.0
        self.btnLogin.clipsToBounds = false
        self.btnLogin.layer.shadowOpacity=0.25
        self.btnLogin.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        self.btnLogin.addTarget(self, action: #selector(self.clickSkip(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnLogin)
        
        self.btnSkip = UIButton()
        self.btnSkip.frame = CGRect(x:  24 , y: CGFloat(btnLogin.frame.maxY) + 5, width: self.view.frame.size.width - 48, height: 45)
        self.btnSkip.setTitle("Skip" , for: .normal)
        self.btnSkip.setTitleColor(UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0),for:.normal)
        self.btnSkip.layer.cornerRadius = 5.0
//        self.btnSkip.backgroundColor = UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.btnSkip.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnSkip.addTarget(self, action: #selector(self.clickSkip(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnSkip)
        
        let signUpLabel = UILabel()
        signUpLabel.frame = CGRect(x:self.view.frame.size.width/2-120, y: CGFloat(self.btnSkip.frame.maxY+40), width: CGFloat(180), height: CGFloat(20))
        signUpLabel.text = "Are you new to DegPeg?"
        signUpLabel.textColor = UIColor.black
        signUpLabel.textAlignment = .center
        signUpLabel.numberOfLines = 1
        signUpLabel.backgroundColor = UIColor.clear
        signUpLabel.font =  UIFont(name: "Avenir-Light", size: 16.0)
        self.viewScrollBg.addSubview(signUpLabel)
        
        
        self.btnSignUp = UIButton()
        self.btnSignUp.frame = CGRect(x:  signUpLabel.frame.maxX , y: CGFloat(self.btnSkip.frame.maxY+40), width: 60, height: 20)
        self.btnSignUp.setTitle("SignUp" , for: .normal)
        self.btnSignUp.setTitleColor(UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0),for:.normal)
        self.btnSignUp.layer.cornerRadius = 5.0
//        self.btnSkip.backgroundColor = UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.btnSignUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnSignUp.addTarget(self, action: #selector(self.clickSignUp(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnSignUp)
        
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
    
    @objc func clickSkip(_ sender:AnyObject!) {
        
    }
    
    @objc func clickForgot(_ sender:AnyObject!) {
        
    }
    @objc func clickSignUp(_ sender:AnyObject!) {
        
    }
}
extension UIView {
func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
