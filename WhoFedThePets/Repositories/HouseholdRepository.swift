//
//  HouseholdRepository.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/16/26.
//

import Foundation

@Observable class HouseholdRepository {
    private(set) var households: [Household] = []
    
    func createHousehold(by creator: User) throws {
        var newHousehold = Household(creator: creator)
        creator.createdHouseholds.append(newHousehold.id)
        households.append(newHousehold)
        
        // TODO: add database logic
        
    }
    
    // I'm adding householdAdmin here because I may add a feature later where there can more than 1 admin
    func addMember(to householdId: UUID, by actor: User, user: HouseholdMember) throws {
        guard let household = households.first(where: {$0.id == householdId}) else { return }
        
        do {
            try household.addMember(user, by: actor)
            // TODO: add database logic
        } catch {
            throw error
        }
    }
    
    func createFeedingSchedule(to householdId: UUID, for pets: [Pet], intervals: [Interval], by householdAdmin: User) {
        guard let household = households.first(where: { $0.id == householdId}) else { return }
        
        
    }
    
    
}
