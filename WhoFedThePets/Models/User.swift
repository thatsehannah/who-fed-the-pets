//
//  User.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

@Observable class User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var lastFeed: Date
    var createdHouseholds: [UUID]
    var invitedHouseholds: [UUID]
    var createdOn: Date
    
    init(name: String, lastFeed: Date) {
        self.name = name
        self.lastFeed = lastFeed
        self.createdHouseholds = []
        self.invitedHouseholds = []
        self.createdOn = Date.now
    }
    
    // TODO: func for loggin feed
    
}
