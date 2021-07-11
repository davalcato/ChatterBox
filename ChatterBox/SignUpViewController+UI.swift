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
        
        
        
    }
    func setupFullNameTextField() {
        
        
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


