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


