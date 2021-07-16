//
//  ForgotPasswordViewController.swift
//  ChatterBox
//

//  rickholmes544@gmail.com / Firebase
//  Created by Daval Cato on 7/14/21.
//

import UIKit

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
    
}
