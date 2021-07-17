//
//  SignUpViewController.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/11/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Method
        setupUI()
        
    }
    
    func setupUI() {
        
        
        setupTitleLabel()
        setupAvatar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
        
    }
    @IBAction func dismissAction(_ sender: Any) {
        // Push back to close X button
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        // Firebase login
        Auth.auth().createUser(
            withEmail: "test5@gmail.com",
            password: "123456") { (authDataResult, error) in
            if error != nil {
                
                print(error!.localizedDescription)
                return
            }
            // Dictionary to hold users data
            if let authData = authDataResult {
                print(authData.user.email as Any)
                // JSON stored data
                let dict: Dictionary<String, Any> = [
                    "uid": authData.user.uid,
                    "email": authData.user.email as Any,
                    "profileImageUrl": "",
                    "status": ""
                ]
                
                // Reference root database location (Big Node)
                Database.database().reference().child("users")
                    .child(authData.user.uid).updateChildValues(dict) {
                    error, ref in
                    if error == nil {
                        print("Done")
                        
                    }
                }
            }
        }
    }
}
