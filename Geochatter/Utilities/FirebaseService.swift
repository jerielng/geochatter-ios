//
//  FirebaseService.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import Firebase

class FirebaseService {
    static let sharedInstance = FirebaseService()
    let bubblesCollection = "bubbles"
    
    private var database: Firestore?
    
    func startService() {
        FirebaseApp.configure()
        database = Firestore.firestore()
    }
    
    func uploadBubble(_ bubble: Bubble) {
        var _: DocumentReference? =
            database?.collection(bubblesCollection).addDocument(data: [
                "author": "\(bubble.authorId)",
                "text": "\(bubble.chatterText)",
                "latitude": "\(bubble.coordinateLat)",
                "longitude": "\(bubble.coordinateLng)"
                ],
                                                                completion: { error in
                                                                    
            })
    }
}
