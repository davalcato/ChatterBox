//
//  SignInViewController+UI.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/14/21.
//

import UIKit

extension SignInViewController {
    
func setupTitleLabel() {
        
        let title = "Sign In"
        
        let attributedText = NSMutableAttributedString(
            string: title, attributes:
                [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                 NSAttributedString.Key.foregroundColor : UIColor.black
                ])
        
     
        
        titleTextLabel.attributedText = attributedText
        
    }
    
    func setupEmailTextField() {
        
        // Has border
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(
                red: 210/255,
                green: 210/255,
                blue: 210/255,
                alpha: 1).cgColor
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.clipsToBounds = true
            
            emailTextField.borderStyle = .none
            
        // Name placeholder
            let placeholderAttr = NSAttributedString(
                string: "Email Address",
                attributes: [NSAttributedString.Key.foregroundColor : UIColor(
                    red: 170/255,
                    green: 170/255,
                    blue: 170/255,
                    alpha: 1)])
            
            // attributedString
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor(
                red: 99/255,
                green:99/255,
                blue: 99/255,
                alpha: 1)
        
    }
    func setupPasswordTextField() {
        
        // Has border
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(
                red: 210/255,
                green: 210/255,
                blue: 210/255,
                alpha: 1).cgColor
        passwordContainerView.layer.cornerRadius = 3
        passwordContainerView.clipsToBounds = true
            
            passwordTextField.borderStyle = .none
            
        // Name placeholder
            let placeholderAttr = NSAttributedString(
                string: "Password (8+ Characters)",
                attributes: [NSAttributedString.Key.foregroundColor : UIColor(
                    red: 170/255,
                    green: 170/255,
                    blue: 170/255,
                    alpha: 1)])
            
            // attributedString
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor(
                red: 99/255,
                green:99/255,
                blue: 99/255,
                alpha: 1)
        
    }
    func setupSignInButton() {
        // Set signUpButton
        signInButton.setTitle("Sign In", for: UIControl.State.normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInButton.layer.cornerRadius = 5
        signInButton.clipsToBounds = true
        signInButton.backgroundColor = .black
        signInButton.setTitleColor(.white, for: UIControl.State.normal)
        
    }
    func setupSignUpButton() {
        
        let attributedText = NSMutableAttributedString(
            string: "Don't have an account? ",
            attributes: [NSAttributedString.Key.font :
                            UIFont.systemFont(ofSize: 16),
                 NSAttributedString.Key.foregroundColor : UIColor(white: 0,
                                                                  alpha: 0.65)
                ])
        
        let attributedSubText = NSMutableAttributedString(
            string: "Sign Up", attributes:
                [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
                 NSAttributedString.Key.foregroundColor : UIColor.black
                 
                 ])
                 attributedText.append(attributedSubText)
                 signUpButton.setAttributedTitle(attributedText, for: .normal)
        
        }
}




