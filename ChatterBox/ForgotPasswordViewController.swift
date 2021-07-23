//
//  ForgotPasswordViewController.swift
//  ChatterBox
//

//  rickholmes544@gmail.com / Firebase
//  Created by Daval Cato on 7/14/21.
//

import UIKit
import ProgressHUD


class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    func setupUI() {
        setupEmailTextField()
        setupResetButton()
        
    }
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func resetPasswordDidTapped(_ sender: Any) {
        // If empty string display alert
        guard let email = emailTextField.text, email != "" else {
            // Describes the error
            ProgressHUD.showError(ERROR_EMPTY_EMAIL_RESET)
            // Call return if email is empty
            return
        }
        // Call reset password in the forgot controller
        API.User.resetPassword(
            email: email,
            onSuccess: {
            // Dismis keyboard
            self.view.endEditing(true)
            // If it is a success
            ProgressHUD.showSucceed(SUCCESS_EMAIL_RESET)
            // App navigates back to the controller
            self.navigationController?.popViewController(animated: true)
        }) { (errorMessage) in
            // Otherwise if an error occurs show
            ProgressHUD.showError(errorMessage)
        }
        
    }
    
}
