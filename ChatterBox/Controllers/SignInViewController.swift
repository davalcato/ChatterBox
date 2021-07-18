//
//  SignInViewController.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/14/21.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    func setupUI() {
        setupTitleLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
        
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func signInButtonDidTapped(_ sender: Any) {
        self.view.endEditing(true)
        // Make app more robust
        self.validateFields()
        // Factor code into smaller units
        self.signIn(onSuccess: {
            // Switch view
            
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
        // Send the selected image to Firebase
        
    }
}
   
