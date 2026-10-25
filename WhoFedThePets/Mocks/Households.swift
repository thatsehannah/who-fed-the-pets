//
//  Households.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/22/26.
//

import Foundation

enum MockHouseholds {
    static let household1 = Household(creator: MockUsers.user1)
    
//    the closure pattern lets me run multiple steps before producing a final value, because a plain static let can only be assigned the result of a single expression, like for household1.
    static let household2 = {
        let household = Household(creator: MockUsers.user2)
        
        let newMember = HouseholdMember(userId: MockUsers.user1.id, role: .standard)
        try? household.requestToAddNewMemberToHousehold(MockUsers.user1, role: .standard, by: household.creator) // This will show as pending
        
        let newPet = Pet(name: "Kodak", type: .cat, age: 1, color: "black", gender: .male)
        try? household.addPet(newPet, by: household.creator)
        
        return household
    }()
    
    // TODO: Create another household with MockUsers.user1 already included in the activeMembers array
    static let household3 = {
        let household = Household(creator: MockUsers.user3)
        
        let standardMember = HouseholdMember(userId: MockUsers.user2.id, role: .standard, householdId: household.id)
        let guest = HouseholdMember(userId: MockUsers.user1.id, role: .guest, householdId: household.id)
        
        try? household.addMember(standardMember)
        try? household.addMember(guest)
        
        return household
    }()
}
