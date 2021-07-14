//
//  ForgotPassowordViewController+UI.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/14/21.
//

import UIKit

extension ForgotPasswordViewController {
    
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
    
    func setupResetButton() {
        // Set signUpButton
        resetButton.setTitle("RESET MY PASSWORD", for: UIControl.State.normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        resetButton.layer.cornerRadius = 5
        resetButton.clipsToBounds = true
        resetButton.backgroundColor = .black
        resetButton.setTitleColor(.white, for: UIControl.State.normal)
        
    }
    
}
