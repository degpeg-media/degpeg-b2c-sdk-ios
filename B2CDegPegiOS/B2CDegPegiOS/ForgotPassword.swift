//
//  ForgotPassword.swift
//  B2CDegPegiOS
//
//  Created by Apple on 3/21/22.
//

import UIKit

class ForgotPassword:  UIViewController, UITextFieldDelegate {
    var viewScrollBg = UIView()
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var SendCode = UIButton()
    var txtFld_Email:UITextField!
    var btnSignUp = UIButton()

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
        
        self.SendCode = UIButton()
        self.SendCode.frame = CGRect(x:  24 , y: CGFloat(txtFld_Email.frame.maxY+20), width: self.view.frame.size.width - 48, height: 50)
        self.SendCode.setTitle("Send a Code" , for: .normal)
        self.SendCode.setTitleColor(UIColor.white,for:.normal)
        self.SendCode.layer.cornerRadius = 5.0
        self.SendCode.backgroundColor = UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.SendCode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.SendCode.layer.cornerRadius = 8.0
        self.SendCode.clipsToBounds = false
        self.SendCode.layer.shadowOpacity=0.25
        self.SendCode.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        self.SendCode.addTarget(self, action: #selector(self.clickSendCode(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.SendCode)
       
        let signUpLabel = UILabel()
        signUpLabel.frame = CGRect(x: 70 , y: screenHeight-120, width: 180, height: 50)
        signUpLabel.text = "Are you new to DegPeg?"
        signUpLabel.textColor = UIColor.black
        signUpLabel.textAlignment = .center
        signUpLabel.numberOfLines = 1
        signUpLabel.backgroundColor = UIColor.clear
        signUpLabel.font =  UIFont(name: "Avenir-Light", size: 16.0)
        self.viewScrollBg.addSubview(signUpLabel)
        
        self.btnSignUp = UIButton()
        self.btnSignUp.frame = CGRect(x:  signUpLabel.frame.maxX , y: screenHeight-120, width: 60, height: 50)
        self.btnSignUp.setTitle("SignUp" , for: .normal)
        self.btnSignUp.setTitleColor(UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0),for:.normal)
        self.btnSignUp.layer.cornerRadius = 5.0
//      self.btnSkip.backgroundColor = UIColor(red: 214.0/255.0, green: 21.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.btnSignUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.btnSignUp.addTarget(self, action: #selector(self.clickSignUp(_:)), for: .touchUpInside)
        self.viewScrollBg.addSubview(self.btnSignUp)
    }
    
    //MARK: toggleBtn Action
    
    @objc func clickSendCode(_ sender:AnyObject!) {
        
    }
    
    @objc func clickSignUp(_ sender:AnyObject!) {
        
    }
}

