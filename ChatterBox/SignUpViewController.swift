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
        // Send the selected image to Firebase
        guard let imageSelected = self.image else {
            // Assign variable
            print("Avatar is nil")
            
            // Access value
            return
        }
        
        // Constant to hold converted data
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            
            return
        }
        
        // Firebase login
        Auth.auth().createUser(
            withEmail: "test12@gmail.com",
            password: "123456") { (authDataResult, error) in
            if error != nil {
                
                print(error!.localizedDescription)
                return
            }
            // Dictionary to hold users data
            if let authData = authDataResult {
                print(authData.user.email as Any)
                // JSON stored data
                var dict: Dictionary<String, Any> = [
                    "uid": authData.user.uid,
                    "email": authData.user.email as Any,
                    "profileImageUrl": "",
                    "status": "Welcome to ChatterBox"
                ]
                
                // Define constant pointing to where the firebase project lives
                let storageRef = Storage.storage().reference(forURL: "gs://chatterbox-c8f23.appspot.com")
                
                // Node containing profile photos of all users
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                
                // Use user ID has coresponded
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                // Image data in storage location
                storageProfileRef.putData(imageData,
                                          metadata: metadata)
                    { (storageMetaData, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        // If yes then return to function
                        return
                    }
                        
                        storageProfileRef.downloadURL(completion: { (url, error) in
                            if let metaImageUrl = url?.absoluteString {
                                dict["profileImageUrl"] = metaImageUrl
                                
                                // Reference root database location (Big Node)
                                Database.database().reference().child("users")
                                    .child(authData.user.uid).updateChildValues(dict) {
                                    error, ref in
                                    if error == nil {
                                        print("Done")
                                        
                                }
                            }
                        }
                    })
                }
            }
        }
    }
}
