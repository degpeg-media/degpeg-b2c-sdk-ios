//
//  KeyboardDis.swift
//  degpeg-b2c-sdk-ios
//
//  Created by Apple on 3/10/22.
//

import Foundation
extension UITextField {
    @IBInspectable var doneAccessory:Bool {
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
            
        }
    }
    func addDoneButtonOnKeyboard() {
           let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
           doneToolbar.barStyle = .default

           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)

           let items = [flexSpace, done]
           doneToolbar.items = items
           doneToolbar.sizeToFit()

           self.inputAccessoryView = doneToolbar
       }
    @objc func doneButtonAction(){
        self.resignFirstResponder()
    }
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func toStyledTextField() { // Give Round Border and Left Placholder Padding
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 10
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
            self.leftViewMode = UITextField.ViewMode.always
        }
    class func attributedTextField(frame: CGRect) -> UITextField {
            let textField = UITextField(frame: frame)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.layer.cornerRadius = 25
            textField.layer.borderColor = UIColor(r: 34, g: 140, b: 204, a: 1).CGColor
            textField.layer.borderWidth = 2.0
            textField.layer.masksToBounds = true
            /* Paddings */
            textField.leftView = UIView(frame: CGRectMake(0, 0, 25, 0))
            textField.leftViewMode = UITextFieldViewMode.Always
            textField.rightView = UIView(frame: CGRectMake(0, 0, 25, 0))
            textField.rightViewMode = UITextFieldViewMode.Always
            /* Place Holder Formating */
            textField attributes = [
                              NSForegroundColorAttributeName: UIColor(r: 34, g: 140, b: 204, a: 1),
                              NSFontAttributeName : UIFont(name: "HelveticaNeue-Thin", size: 16)! // Note the !
                              ]
            textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes:attributes)
            return textField
        }
}
