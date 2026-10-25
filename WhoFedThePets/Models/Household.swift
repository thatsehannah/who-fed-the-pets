//
//  Household.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

enum HouseholdError: Error {
    case notAuthorized
    case notInvited
}

@Observable class Household: Identifiable {
    var id: UUID
    var name: String
    var pets: [Pet]
    var creator: User
    var pendingMembers: [HouseholdMember]
    var activeMembers: [HouseholdMember]
    var feedingSchedules: [FeedingSchedule]
    var currentFeedSchedules: [FeedingSchedule]
    var previousFeedingSchedules: [FeedingSchedule]
    var createdOn: Date
    
    init(creator: User) {
        self.id = UUID()
        self.name = "\(creator.lastName) Household"
        self.pets = []
        self.creator = creator
        self.pendingMembers = []
        self.activeMembers = []
        self.feedingSchedules = []
        self.currentFeedSchedules = []
        self.previousFeedingSchedules = []
        self.createdOn = Date.now
        
        let firstMember = HouseholdMember(userId: creator.id, role: .admin, householdId: self.id)
        activeMembers.append(firstMember)
    }
    
    private func getCurrentRole(of user: User) -> MemberType? {
        activeMembers.first(where: {$0.userId == user.id})?.role
    }
    
    func requestToAddNewMemberToHousehold(_ user: User, role: MemberType, by actor: User) throws {
        // this is where a text message will be sent
        guard getCurrentRole(of: actor) == .admin else { throw HouseholdError.notAuthorized }
        
        let requestedMember = HouseholdMember(userId: user.id, role: role, householdId: self.id, addedBy: actor.id)
        pendingMembers.append(requestedMember)
    }
    
    func addMember(_ newHouseholdMember: HouseholdMember) throws {
        guard newHouseholdMember.householdId != nil else { throw HouseholdError.notInvited }
        
        activeMembers.append(newHouseholdMember)
    }
    
    func addPet(_ newPet: Pet, by actor: User) throws {
        guard getCurrentRole(of: actor) == .admin else { throw HouseholdError.notAuthorized }
        
        let newPet = newPet
        newPet.addedBy = actor.id
        newPet.householdId = self.id
        
        pets.append(newPet)
    }
    
    func addFeedingSchedule(_ newFeedingSchedule: FeedingSchedule, by actor: User) throws {
        guard getCurrentRole(of: actor) == .admin else { throw HouseholdError.notAuthorized }
        
        feedingSchedules.append(newFeedingSchedule)
    }
    
}
