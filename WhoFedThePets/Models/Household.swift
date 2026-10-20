//
//  Household.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

enum HouseholdError {
    case notAuthorized
}

@Observable class Household: Identifiable {
    var id: UUID = UUID()
    var pets: [Pet]
    var creator: User
    var members: [HouseholdMember]
    var feedingSchedules: [FeedingSchedule]
    var currentFeedSchedules: [FeedingSchedule]
    var previousFeedingSchedules: [FeedingSchedule]
    var createdOn: Date
    
    init(creator: User) {
        self.pets = []
        self.creator = creator
        self.members = []
        self.feedingSchedules = []
        self.currentFeedSchedules = []
        self.previousFeedingSchedules = []
        self.createdOn = Date.now
        
        var firstMember = HouseholdMember(userId: creator.id, householdId: self.id, role: .admin)
        members.append(firstMember)
    }
    
    // TODO: func for adding members
    func addMember(_ user: User, by: User) throws {
        let newHouseholdMember = HouseholdMember(userId: user.id, householdId: self.id, role: .standard)
        self.members.append(newHouseholdMember)
    }
    
    // TODO: func for adding pets
    func addPet(_ pet: Pet) {
        self.pets.append(pet)
    }
    
    // TODO: func for adding feeding schedule
    func addFeedingSchedule(_ schedule: FeedingSchedule) {
        self.feedingSchedules.append(schedule)
    }
    
}
