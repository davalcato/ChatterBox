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
        let subTitle = "\n\n\n\n\n\nIf using a storyboard, the `window` property will automatically be initia"
        
        let attributedText = NSMutableAttributedString(
            string: title, attributes:
                [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                 NSAttributedString.Key.foregroundColor : UIColor.black
                ])
        
        let attributedSubTitle = NSMutableAttributedString(
            string: subTitle, attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                 NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.45)
                ])
        
        
        // Attributed text include two variables
        attributedText.append(attributedSubTitle)
        
        // Line spacing
        let paragrapStyle = NSMutableParagraphStyle()
        // Set line spacing
        paragrapStyle.lineSpacing = 5

        // Add paragrapher
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle,
                                    value: paragrapStyle, range: NSMakeRange(0, attributedText.length))
        titleLabel.numberOfLines = 0
        
        titleLabel.attributedText = attributedText
        
    }


}

