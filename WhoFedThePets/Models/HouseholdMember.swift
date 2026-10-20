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
    var householdId: UUID
    var role: MemberType
}
