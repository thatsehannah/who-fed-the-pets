//
//  MockHouseholdRepository.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/22/26.
//

import Foundation

@Observable class MockHouseholdRepository: HouseholdRepositoryProtocol {
    private(set) var households: [Household] = [MockHouseholds.household1, MockHouseholds.household2, MockHouseholds.household3]
    private(set) var currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        households = try! getHouseholds(for: currentUser)
    }
    
    func createHousehold(by creator: User) throws {
        let newHousehold = Household(creator: creator)
        creator.createdHouseholds.append(newHousehold.id)
        households.append(newHousehold)
    }
    
    internal func getHouseholds(for user: User) throws -> [Household] {
        var households = self.households
        var allUserHouseholds: [Household] = []
        
//        let createdHouseholds = households.filter { $0.creator.id == user.id }
//        for household in createdHouseholds {
//            allUserHouseholds.append(household)
//            // TODO: Remove household from households
//        }
        
        let activeMemberHouseholds = households.filter { $0.activeMembers.contains(where: { $0.userId == user.id}) }
        for household in activeMemberHouseholds {
            allUserHouseholds.append(household)
        }
        
        

        
        return allUserHouseholds
    }
    
    
    
    func requestToAddNewMemberToHousehold(householdId: UUID, by actor: User, user: User, role: MemberType) throws {
        let household = households.first(where: {$0.id == householdId})
        
        do {
            try household!.requestToAddNewMemberToHousehold(user, role: role, by: actor)
            print(household!.pendingMembers)
            // TODO: add database logic
        } catch {
            throw error
        }
    }
    
    func addFeedingSchedule(to householdId: UUID, for pets: [Pet], intervals: [Interval], by householdAdmin: User) throws {
        let household = households.first(where: { $0.id == householdId})
    }
}
