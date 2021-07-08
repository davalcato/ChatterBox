//
//  ViewController.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signinFacebookButton: UIButton!
    @IBOutlet weak var signinGoogleButton: UIButton!
    @IBOutlet weak var signinEmailButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Declare the method
    func setupUI() {
        let title = "Create a new account"
        let subtitle = "If using a storyboard, the `window` property will automatically be initia"
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                                                                                   NSAttributedString.Key.foregroundColor : UIColor.brown
                                                                                  ])
        titleLabel.attributedText = attributedText
        
    }


}

