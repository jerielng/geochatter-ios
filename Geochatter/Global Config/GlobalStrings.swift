//
//  GlobalStrings.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/8/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

struct GlobalStrings {
    static let mainVCTitle = "Your Local Chatter"
    static let barItemMyPosts = "My Posts"
    static let barItemNearby = "Nearby"
    static let bubbleInputPrompt = "What do you want to say?"
    static let takePhotoButton = "Take a Photo"
    static let choosePhotoButton = "Choose from Photo Library"
    static let cancel = "Cancel"
    static let locationNotEnabledTitle = "Location Permissions Not Allowed"
    static let locationNotEnabledMessage = "Please enable location services in system settings to make full use of Geochatter"
}

extension GlobalStrings {
}

// MARK: - Firebase Constants
extension GlobalStrings {
    static let bubblesCollection = "bubbles"
    static let authorField = "author"
    static let textField = "text"
    static let latitudeField = "latitude"
    static let longitudeField = "longitude"
}
