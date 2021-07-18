//
//  SignUpViewController.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/11/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD



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
    
    // Type optional UIImage to validate 
    var image: UIImage? = nil
    
    
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
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        // Dismiss keyboard
        self.view.endEditing(true)
        // Make app more robust
        self.validateFields()
        // Factor code into smaller units
        self.signUp(onSuccess: {
            // Switch view
            
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
        // Send the selected image to Firebase
        
    }
}
