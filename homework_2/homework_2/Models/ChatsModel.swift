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
    
    init(image: UIImage,
         name: String,
         lastMessage: String,
         timePassed: String
    ) {
        self.image = image
        self.name = name
        self.lastMessage = lastMessage
        self.timePassed = timePassed
    }
}
