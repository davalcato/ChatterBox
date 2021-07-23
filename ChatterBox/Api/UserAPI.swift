//
//  UserAPI.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/18/21.
//

import Foundation
import FirebaseAuth
import Firebase
import ProgressHUD
import FirebaseStorage


class UserAPI {
    
    // Built in signIn features
    func signIn(email: String,
                password: String,
                onSuccess: @escaping() -> Void,
                onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().signIn(
            withEmail: email,
            password: password) { (authData, error) in
            // Or to the return error
            if error != nil {
                // If auth fails
                onError(error!.localizedDescription)
                return
            }
            // Print out ID of user
            print(authData?.user.uid)
            
            
            onSuccess()
        }
    }
    
    // Pass UIImage from the controller
    func signUp(
        withUsername username: String,
        email: String,
        password: String,
        image: UIImage?,
        onSuccess: @escaping() -> Void,
        onError: @escaping(_ errorMessage: String) -> Void) {
        
        // Firebase login
        Auth.auth().createUser(
            withEmail: email,
            password: password) { (authDataResult, error) in
            if error != nil {
//                print(error!.localizedDescription)
                ProgressHUD.showError(ERROR_EMPTY_PHOTO)
                return
            }
            // Dictionary to hold users data
            if let authData = authDataResult {
                print(authData.user.email as Any)
                // JSON stored data
                var dict: Dictionary<String, Any> = [
                    UID: authData.user.uid,
                    EMAIL: authData.user.email as Any,
                    // Append to the dictionary
                    USERNAME: username,
                    PROFILE_IMAGE_URL: "",
                    STATUS: "Welcome to ChatterBox"
                ]
                
                guard let imageSelected = image else {
                    // Assign variable
        //            print("Avatar is nil")
                    ProgressHUD.showError("Please choose your profile image")
                    // Access value
                    return
                }
                // Convert it to the data format
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    
                    return
                }
                // Call the func
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                
                // Finally upload data to firebase storage
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                
                // Call the method
                StorageService.savePhoto(
                    username: username,
                    uid: authData.user.uid,
                    data: imageData,
                    metadata: metadata,
                    storageProfileRef: storageProfile,
                    dict: dict,
                    onSuccess: {
                    onSuccess()
                },
                    onError: { (errorMessage) in
                        onError(errorMessage)
                })
            }
        }
    }
    // Reset password method
    func resetPassword(email: String, onSuccess: @escaping() -> Void,
                       onError: @escaping(_ errorMessage: String) -> Void) {
        
        // Call send password reset method
        Auth.auth().sendPasswordReset(
            withEmail: email) { (error) in
            // Display an alert prompt showing error or success
            if error == nil {
                // After send pass reset method
                onSuccess()
                // If successful user check inbox then nevigate to signIn view
            } else {
                onError(error!.localizedDescription)
                
            }
        }
    }
}




