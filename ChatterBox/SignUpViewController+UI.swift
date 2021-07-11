//
//  SignUpViewController+UI.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/11/21.
//

import UIKit

extension SignUpViewController {
    
    func setupTitleLabel() {
        
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(
            string: title, attributes:
                [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                 NSAttributedString.Key.foregroundColor : UIColor.black
                ])
        
     
        
        titleTextLabel.attributedText = attributedText
        
    }
    func setupAvatar() {
        // UI circular
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        
        
    }
    func setupFullNameTextField() {
    // Has border
        fullnameContainerView.layer.borderWidth = 1
        fullnameContainerView.layer.borderColor = UIColor(
            red: 210/255,
            green: 210/255,
            blue: 210/255,
            alpha: 1).cgColor
        fullnameContainerView.layer.cornerRadius = 3
        fullnameContainerView.clipsToBounds = true
        
        fullnameTextField.borderStyle = .none
        
    // Name placeholder
        let placeholderAttr = NSAttributedString(
            string: "Full Name",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor(
                red: 170/255,
                green: 170/255,
                blue: 170/255,
                alpha: 1)])
        
        // attributedString
        fullnameTextField.attributedPlaceholder = placeholderAttr
        
    }
    func setupEmailTextField() {
        
        
    }
    func setupPasswordTextField() {
        
        
    }
    func setupSignUpButton() {
        
        
    }
    func setupSignInButton() {
        
        
    }
}


