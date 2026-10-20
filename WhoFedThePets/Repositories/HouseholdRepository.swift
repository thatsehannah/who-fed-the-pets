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
        households.append(newHousehold)
        
        // TODO: add database logic
        
    }
    
    func addMember(to householdId: UUID, by householdAdmin: User, user: User) throws {
        guard let household = households.first(where: {$0.id == householdId}) else { return }
        do {
            try household.addMember(user, by: householdAdmin)
            // TODO: add database logic
        } catch {
            throw error
        }
        
    }
    
    
}
