//
//  Household.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

enum HouseholdError: Error {
    case notAuthorized
}

@Observable class Household: Identifiable {
    var id: UUID
    var pets: [Pet]
    var creator: User
    var members: [HouseholdMember]
    var feedingSchedules: [FeedingSchedule]
    var currentFeedSchedules: [FeedingSchedule]
    var previousFeedingSchedules: [FeedingSchedule]
    var createdOn: Date
    
    init(creator: User) {
        self.id = UUID()
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
    
    func getCurrentRole(of user: User) -> MemberType? {
        members.first(where: {$0.userId == user.id})?.role
    }
    
    // TODO: func for adding members
    func addMember(_ newHouseholdMember: HouseholdMember, by actor: User) throws {
        guard getCurrentRole(of: actor) == .admin else { throw HouseholdError.notAuthorized }
        
        var newHouseholdMemberCopy = newHouseholdMember
        newHouseholdMemberCopy.addedBy = actor.id
        
        members.append(newHouseholdMember)
    }
    
    // TODO: func for adding pets
    func addPet(_ newPet: Pet, by actor: User) {
        pets.append(newPet)
    }
    
    // TODO: func for adding feeding schedule
    func addFeedingSchedule(_ newFeedingSchedule: FeedingSchedule, by actor: User) {
        feedingSchedules.append(newFeedingSchedule)
    }
    
}
