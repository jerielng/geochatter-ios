//
//  UserManager.swift
//  Geochatter
//
//  Created by Jeriel Ng on 5/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

class UserManager {
    static let sharedInstance = UserManager()

    private var currentUser: BubbleAuthor?

    func getCurrentUser() -> BubbleAuthor {
        return currentUser ?? BubbleAuthor(authorId: "0")
    }

    func updateCurrentUser(_ user: BubbleAuthor) {
        currentUser = user
    }
}
