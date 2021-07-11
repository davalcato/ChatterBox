//
//  ViewController.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signInFacebookButton: UIButton!
    @IBOutlet weak var signInPhoneNumberButton: UIButton!
    @IBOutlet weak var signInEmailButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    // Declare the method
    func setupUI() {
        setupHeaderTitle()
        setupTermsLabel()
        setupFacebookButton()
        setupPhoneNumberButton()
        setupEmailButton()
        setupCreateAccountButton()
        
    }

}

