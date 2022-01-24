//
//  ChatsModel.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

struct ChatsModel {
    var image: UIImage?
    var name: String?
    var lastMessage: String?
    var timePassed: String?
    var dates: [DatesMessages]?
    
    init(image: UIImage,
         name: String,
         lastMessage: String,
         timePassed: String,
         dates: [DatesMessages]
    ) {
        self.image = image
        self.name = name
        self.lastMessage = lastMessage
        self.timePassed = timePassed
        self.dates = dates
    }
}

struct DatesMessages {
    var date: String?
    var messages: [Message]?
}

struct Message {
    var isFrom: Bool?
    var messageTest: String?
    var time: String?
}
