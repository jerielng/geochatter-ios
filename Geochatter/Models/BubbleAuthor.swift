//
//  BubbleAuthor.swift
//  Geochatter
//
//  Created by Jeriel Ng on 2/28/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

class BubbleAuthor {
    private var authorId: String
    private var authorName: String

    init(authorId: String) {
        self.authorId = authorId
        self.authorName = ""
    }

    func getName() -> String {
        return authorName
    }

    func getId() -> String {
        return authorId
    }
}
