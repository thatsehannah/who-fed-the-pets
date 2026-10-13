//
//  User.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

enum UserType: String {
    case admin
    case standard
    case guest
}

class User: Identifiable {
    var name: String
    var type: UserType
    var lastFeed: Date
    
    init(name: String, type: UserType, lastFeed: Date) {
        self.name = name
        self.type = type
        self.lastFeed = lastFeed
    }
}
