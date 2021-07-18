//
//  SignUpViewController+UI.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/11/21.
//

import UIKit
import ProgressHUD



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
        // Responsd to users tap
        avatar.isUserInteractionEnabled = true
        // User gesture
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(presentPicker))
        
        // Respond ability
        avatar.addGestureRecognizer(tapGesture)
    }
    @objc func presentPicker() {
        // Present photo library
        let picker = UIImagePickerController()
        // Photo library type
        picker.sourceType = .photoLibrary
        // Configuration for the picker
        picker.allowsEditing = true
        // Assign delegate controller to enable methods
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
        
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
        fullnameTextField.textColor = UIColor(
            red: 99/255,
            green:99/255,
            blue: 99/255,
            alpha: 1)
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
    func setupSignUpButton() {
        // Set signUpButton
        signUpButton.setTitle("Sign Up", for: UIControl.State.normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        signUpButton.backgroundColor = .black
        signUpButton.setTitleColor(.white, for: UIControl.State.normal)
        
    }
    func setupSignInButton() {
        
        let attributedText = NSMutableAttributedString(
            string: "Already have an account? ",
            attributes: [NSAttributedString.Key.font :
                            UIFont.systemFont(ofSize: 16),
                 NSAttributedString.Key.foregroundColor : UIColor(white: 0,
                                                                  alpha: 0.65)
                ])
        
        let attributedSubText = NSMutableAttributedString(
            string: "Sign In", attributes:
                [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
                 NSAttributedString.Key.foregroundColor : UIColor.black
                 
                 ])
                 attributedText.append(attributedSubText)
                 signInButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    // Touches Ended
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func validateFields() {
        // textFields should not be empty
        guard let username = self.fullnameTextField.text, !username.isEmpty else {

            ProgressHUD.showError(ERROR_EMPTY_USERNAME)
            return
        }
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL)
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
            return
        }
        
    }
    // Handler business logic after signup
    func signUp(onSuccess: @escaping() -> Void,
                onError: @escaping(_ errorMessage: String) -> Void) {
        // Show an alert when tap on signUp button
        ProgressHUD.show()
       // Call API
        API.User.signUp(
            withUsername: self.fullnameTextField.text!,
            email: self.emailTextField.text!,
            password: self.passwordTextField.text!,
            image: self.image,
            onSuccess: {
            // dismiss when done
            ProgressHUD.dismiss()
            
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
}

// Update Avatar when users tap on photo in picker
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // Controller can get access to photos
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo
                               info: [UIImagePickerController.InfoKey : Any]) {
    // Display photo on the uiimageview
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            // Assign picked photo once user select photo
            image = imageSelected
            // Edited image key
            avatar.image = imageSelected
        }
        // Assign selected photo for avatar (original image)
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage {
            // Pnoto selected via this dictionary
            image = imageOriginal
            
            avatar.image = imageOriginal
        }
        // Dismiss picker
        picker.dismiss(animated: true, completion: nil)
    }
}

