//
//  User.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

@Observable class User: Identifiable {
    var id: UUID
    var firstName: String
    var lastName: String
    var email: String
    var username: String
    var phoneNumber: String
    var avatarUrl: String?
    var lastFeed: Date?
    var createdHouseholds: [UUID]
    var invitedHouseholds: [UUID]
    var acceptedHouseholds: [UUID]
    var createdOn: Date
    
    init(firstName: String, lastName: String, email: String, username: String, phoneNumber: String) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.username = username
        self.phoneNumber = phoneNumber
        self.avatarUrl = nil
        self.lastFeed = nil
        self.createdHouseholds = []
        self.invitedHouseholds = []
        self.acceptedHouseholds = []
        self.createdOn = Date.now
    }
    
    func changeName(newFirstName: String, newLastName: String) {
        self.firstName = newFirstName
        self.lastName = newLastName
    }
    
    func changeEmail(to newEmail: String) {
        self.email = newEmail
    }
    
    func changePhoneNumber(to newPhoneNumber: String) {
        self.phoneNumber = newPhoneNumber
    }
}
