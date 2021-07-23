//
//  Ref.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/18/21.
//

import Foundation
import Firebase

// Reference class
let REF_USER = "users"
let URL_STORAGE_ROOT = "gs://chatterbox-c8f23.appspot.com"
let STORAGE_PROFILE = "profile"
// String key in global variable
let PROFILE_IMAGE_URL = "profileImageUrl"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
// Update dictionary
let STATUS = "status"
// Error messaging
let ERROR_EMPTY_PHOTO = "Please choose your profile image"
let ERROR_EMPTY_EMAIL = "Please choose your profile address"
let ERROR_EMPTY_USERNAME = "Please enter an username"
let ERROR_EMPTY_PASSWORD = "Please enter a password"
// Error message in global varible email reset password
let ERROR_EMPTY_EMAIL_RESET = "Please enter an email addres for password reset"

// Success method string for reset password
let SUCCESS_EMAIL_RESET = "We have just sent you a password reset email. Please check your inbox and follow the instructions to reset your password"



// All reference nodes
class Ref {
    let databaseRoot: DatabaseReference = Database.database().reference()
    // Store all the url
    var databaseUsers: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    // User ID as parameter
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
        
    }
    
    
    // Global variable
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    // Hold the root url under storage
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    // Profile reference
    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
        
    }
    
}









