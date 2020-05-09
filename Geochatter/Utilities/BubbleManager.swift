//
//  BubbleManager.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/9/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import MapKit

class BubbleManager {
    static let sharedInstance = BubbleManager()

    private var bubblesForCurrentLocation: [Bubble] = []

    func createNewBubble(with text: String) {
        guard let location = LocationService.sharedInstance.getCurrentLocation() else { return }
        let userId: String = UserManager.sharedInstance.getCurrentUser().authorId
        let bubble = Bubble(authorId: userId,
                            chatterText: text,
                            dateTime: DateManager.getCurrentDate(),
                            coordinateLat: location.coordinate.latitude,
                            coordinateLng: location.coordinate.longitude)
        FirebaseService.sharedInstance.uploadBubble(bubble)
    }

    func getCurrentBubbles() -> [Bubble] {
        return bubblesForCurrentLocation
    }

    func updateCurrentBubbles(currentBubbles: [Bubble]) {
        bubblesForCurrentLocation = currentBubbles
    }

    func parseBubbleFields(dictionary: [String: Any]) -> Bubble? {
        let currentUserLocation = LocationService.sharedInstance.getCurrentLocation()
        guard let latitude = convertFieldToDouble(dictionary[GlobalStrings.latitudeField]),
            let longitude = convertFieldToDouble(dictionary[GlobalStrings.longitudeField]),
            currentUserLocation?.coordinate.latitude == latitude,
            currentUserLocation?.coordinate.longitude == longitude,
            let authorId = dictionary[GlobalStrings.authorField] as? String,
            let chatterText = dictionary[GlobalStrings.textField] as? String else { return nil }
        return Bubble(authorId: authorId,
                      chatterText: chatterText,
                      dateTime: Date(),
                      coordinateLat: latitude,
                      coordinateLng: longitude)
    }

    func convertFieldToDouble(_ dictionaryValue: Any?) -> Double? {
        guard let valueAsString = dictionaryValue as? String,
            let double = Double(valueAsString) else { return nil }
        return double
    }
}
