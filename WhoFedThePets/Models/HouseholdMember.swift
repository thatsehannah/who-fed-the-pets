//
//  File.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/14/26.
//

import Foundation

enum MemberType: String {
    case admin
    case standard
    case guest
}

struct HouseholdMember {
    var userId: UUID
    var householdId: UUID?
    var role: MemberType
    var addedBy: UUID?
    var acceptedInvitation: Bool
    var createdOn: Date
    
    init(userId: UUID, role: MemberType, householdId: UUID? = nil, addedBy: UUID? = nil) {
        self.userId = userId
        self.householdId = householdId
        self.role = role
        self.addedBy = addedBy ?? userId
        self.acceptedInvitation = false
        self.createdOn = .now
    }
}

