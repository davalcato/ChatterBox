//
//  StorageService.swift
//  ChatterBox
//
//  Created by Daval Cato on 7/18/21.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import ProgressHUD

class StorageService {
    
    static func savePhoto(
        username: String,
        uid: String,
        data: Data,
        metadata: StorageMetadata,
        storageProfileRef: StorageReference,
        dict: Dictionary<String, Any>,
        onSuccess: @escaping() -> Void,
        onError: @escaping(_ errorMessage: String) -> Void)
        {
            
            storageProfileRef.putData(data,
                            metadata: metadata)
                { (storageMetaData, error) in
                if error != nil {
                    onError(error!.localizedDescription)
                    // If yes then return to function
                    return
                }
                    storageProfileRef.downloadURL(completion: { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            // Storing current user data
                            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                                // Download from the database
                                changeRequest.photoURL = url
                                changeRequest.displayName = username
                                changeRequest.commitChanges { (error) in
                                    if let error = error {
                                        // Get info after signin is successful
                                        ProgressHUD.showError(error.localizedDescription)
                                    }
                                }
                            }
                            // Dictionary to store
                            var dicTemp = dict
                            
                            dicTemp[PROFILE_IMAGE_URL] = metaImageUrl
                            
                            // Reference root database location (Big Node)
                            Ref().databaseSpecificUser(uid: uid).updateChildValues(dicTemp,
                                        withCompletionBlock: { (error, ref) in
                                if error == nil {
                                    onSuccess()
                            // Show alert when signup is done
                                } else {
                                    onError(error!.localizedDescription)
                        }
                    })
                }
            })
        }
    }
}












