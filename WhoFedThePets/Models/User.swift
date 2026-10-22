//
//  User.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

@Observable class User: Identifiable {
    var id: UUID
    var name: String
    var email: String
    var username: String
    var phoneNumber: String
    var avatarUrl: String?
    var lastFeed: Date?
    var createdHouseholds: [UUID]
    var invitedHouseholds: [UUID]
    var createdOn: Date
    
    init(name: String, email: String, username: String, phoneNumber: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.username = username
        self.phoneNumber = phoneNumber
        self.avatarUrl = nil
        self.lastFeed = nil
        self.createdHouseholds = []
        self.invitedHouseholds = []
        self.createdOn = Date.now
    }
    
    func changeName(to newName: String) {
        self.name = newName
    }
    
    func changeEmail(to newEmail: String) {
        self.email = newEmail
    }
    
    func changePhoneNumber(to newPhoneNumber: String) {
        self.phoneNumber = newPhoneNumber
    }
}
