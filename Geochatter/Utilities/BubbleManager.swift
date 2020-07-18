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

    weak var delegate: UpdateDelegate?

    func createNewBubble(with text: String) {
        guard let location = LocationService.sharedInstance.getCurrentLocation() else { return }
        let userId: String = UserManager.sharedInstance.getCurrentUser().getId()
        let bubble = Bubble(bubbleId: nil,
                            authorId: userId,
                            chatterText: text,
                            dateTime: FormatterUtils.getCurrentDate(),
                            coordinateLat: FormatterUtils.roundLocationValue(value: location.coordinate.latitude),
                            coordinateLng: FormatterUtils.roundLocationValue(value: location.coordinate.longitude))
        FirebaseService.sharedInstance.postBubble(bubble)
    }

    func getCurrentBubbles() -> [Bubble] {
        return bubblesForCurrentLocation
    }

    func updateCurrentBubbles(currentBubbles: [Bubble]) {
        bubblesForCurrentLocation = currentBubbles
        delegate?.didUpdateData()
    }

    func parseBubbleFields(from dictionary: [String: Any]) -> Bubble? {
        guard let latitude = convertFieldToDouble(dictionary[GlobalStrings.latitudeField]),
            let longitude = convertFieldToDouble(dictionary[GlobalStrings.longitudeField]),
            !LocationService.sharedInstance.isLocationDifferent(latitude: latitude, longitude: longitude),
            let authorId = dictionary[GlobalStrings.authorField] as? String,
            let chatterText = dictionary[GlobalStrings.textField] as? String else { return nil }
        return Bubble(bubbleId: nil,
                      authorId: authorId,
                      chatterText: chatterText,
                      dateTime: FormatterUtils.getCurrentDate(),
                      coordinateLat: latitude,
                      coordinateLng: longitude)
    }

    func convertFieldToDouble(_ dictionaryValue: Any?) -> Double? {
        guard let valueAsString = dictionaryValue as? String,
            let double = Double(valueAsString) else { return nil }
        return double
    }
}
