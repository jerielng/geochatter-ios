//
//  FirebaseService.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import Firebase
import FirebaseFirestore

class FirebaseService {
    static let sharedInstance = FirebaseService()

    private var database: Firestore?

    weak var delegate: UpdateDelegate?

    func startService() {
        FirebaseApp.configure()
        database = Firestore.firestore()
    }

    func downloadBubbles() {
        database?
            .collection(GlobalStrings.bubblesCollection)
            .getDocuments(completion: { querySnapshot, error in
                guard error == nil, let documents = querySnapshot?.documents else { return }
                var bubblesArray = [Bubble]()
                for document in documents {
                    guard let bubble = BubbleManager.sharedInstance.parseBubbleFields(from: document.data()) else { continue }
                    bubblesArray.append(bubble)
                }
                BubbleManager.sharedInstance.updateCurrentBubbles(currentBubbles: bubblesArray)
            })
    }

    func postBubble(_ bubble: Bubble) {
        database?
            .collection(GlobalStrings.bubblesCollection)
            .addDocument(data: [
                GlobalStrings.authorField: "\(bubble.authorId)",
                GlobalStrings.textField: "\(bubble.chatterText)",
                GlobalStrings.latitudeField: "\(bubble.coordinateLat)",
                GlobalStrings.longitudeField: "\(bubble.coordinateLng)"
                ],
                         completion: { [weak self] error in
                            guard error == nil else { return }
                            self?.downloadBubbles()
            })
    }

    func deleteBubble(_ bubble: Bubble) {
        guard let documentId = bubble.bubbleId else { return }
        database?
            .collection(GlobalStrings.bubblesCollection)
            .document(documentId)
            .delete { [weak self] error in
                guard let _ = error else { return }
            }
    }
}
