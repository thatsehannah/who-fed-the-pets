//
//  HouseholdRepository.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/16/26.
//

import Foundation

@Observable class HouseholdRepository: HouseholdRepositoryProtocol {
    private(set) var households: [Household] = []
    private(set) var currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        households = try! getHouseholds(for: currentUser)
    }
    
    func createHousehold(by creator: User) throws {
        let newHousehold = Household(creator: creator)
        creator.createdHouseholds.append(newHousehold.id)
        households.append(newHousehold)
        
        // TODO: add database logic
        
    }
    
    func getHouseholds(for user: User) throws -> [Household] {
        var allUserHouseholds: [Household] = []
        
        let createdHouseholds = households.filter { $0.creator.id == user.id }
        let activeMemberHouseholds = households.filter { $0.activeMembers.contains(where: { $0.userId == user.id}) }
        
        for household in createdHouseholds {
            allUserHouseholds.append(household)
        }
        
        for household in activeMemberHouseholds {
            allUserHouseholds.append(household)
        }
        
        return allUserHouseholds
    }
    
    // I'm adding actor here because I may add a feature later where there can more than 1 admin who can make a request to add a member
    func requestToAddNewMemberToHousehold(householdId: UUID, by actor: User, user: User, role: MemberType) throws {
        guard let household = households.first(where: {$0.id == householdId}) else { return }
        
        do {
            try household.requestToAddNewMemberToHousehold(user, role: role, by: actor)
            print(household.pendingMembers)
            // TODO: add database logic
        } catch {
            throw error
        }
    }
    
    func addFeedingSchedule(to householdId: UUID, for pets: [Pet], intervals: [Interval], by householdAdmin: User) throws {
        guard let household = households.first(where: { $0.id == householdId}) else { return }
        
        
    }
    
    
}
