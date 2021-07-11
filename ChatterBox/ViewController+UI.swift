//
//  ViewController+UI.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/11/21.
//

import UIKit

extension ViewController {
    func setupHeaderTitle() {
        let title = "Create a new account"
        let subTitle = "\n\n\n\n\n\nIf using a storyboard, the `window` property will automatically be initia"
        
        let attributedText = NSMutableAttributedString(
            string: title, attributes:
                [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                 NSAttributedString.Key.foregroundColor : UIColor.black
                ])
        
        let attributedSubTitle = NSMutableAttributedString(
            string: subTitle, attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                 NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.45)
                ])
        
        
        // Attributed text include two variables
        attributedText.append(attributedSubTitle)
        
        // Line spacing
        let paragrapStyle = NSMutableParagraphStyle()
        // Set line spacing
        paragrapStyle.lineSpacing = 5

        // Add paragrapher
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle,
                                    value: paragrapStyle, range: NSMakeRange(0, attributedText.length))
        titleLabel.numberOfLines = 0
        
        titleLabel.attributedText = attributedText
    }
    
    func setupFacebookButton() {
        // Set Facebook
        signInFacebookButton.setTitle("SignUp with Facebook", for: UIControl.State.normal)
        signInFacebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      
        signInFacebookButton.layer.cornerRadius = 7
        signInFacebookButton.clipsToBounds = true

        // Add icon
        let origImage = UIImage(named: "facebook")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        signInFacebookButton.setImage(tintedImage, for: .normal)
        signInFacebookButton.backgroundColor = .blue
        
    }
    func setupPhoneNumberButton() {
        
        // Set phone number button
        signInPhoneNumberButton.setTitle("SignUp with Phone Number", for: UIControl.State.normal)
        signInPhoneNumberButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      
        signInPhoneNumberButton.layer.cornerRadius = 7
        signInPhoneNumberButton.clipsToBounds = true
      
//        signInPhoneNumberButton.setImage(tintedImage, for: .normal)
        signInPhoneNumberButton.backgroundColor = .red
        
        signInPhoneNumberButton.setImage(UIImage(named: "phone"), for: .normal)
        
    }
    func setupEmailButton() {
        
        // Set email
        signInEmailButton.setTitle("SignUp with Email", for: UIControl.State.normal)
        signInEmailButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      
        signInEmailButton.layer.cornerRadius = 7
        signInEmailButton.clipsToBounds = true
        
//        signInEmailButton.setImage(tintedImage, for: .normal)
        signInEmailButton.backgroundColor = .green
        
        signInEmailButton.setImage(UIImage(named: "email"), for: .normal)
        
        
    }
    func setupTermsLabel() {
        
        let attributedTermsText = NSMutableAttributedString(
            string: "By clicking Create a new account you agree to our Terms of service ", attributes:
                [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 14)!,
                 NSAttributedString.Key.foregroundColor : UIColor(white: 0,
                                                                  alpha: 0.65)
                ])
        
        let attributedSubTermsText = NSMutableAttributedString(
            string: "Terms of service", attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
                 NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)
                ])
        
        attributedSubTermsText.append(attributedSubTermsText)
        
        termsOfServiceLabel.attributedText = attributedTermsText
        termsOfServiceLabel.numberOfLines = 0
        
    }
    
    func setupCreateAccountButton() {
        
        // Set create account
        createAccountButton.setTitle("Create a new account", for: UIControl.State.normal)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
      
        createAccountButton.layer.cornerRadius = 7
        createAccountButton.clipsToBounds = true
        
        createAccountButton.backgroundColor = .black
        
    }
    
}
