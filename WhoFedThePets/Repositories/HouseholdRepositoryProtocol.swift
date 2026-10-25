//
//  HouseholdRepositoryProtocol.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/22/26.
//

import Foundation

protocol HouseholdRepositoryProtocol: AnyObject {
    var households: [Household] { get }
    var currentUser: User { get }
    func createHousehold(by creator: User) throws
    func getHouseholds(for user: User) throws -> [Household]
    func requestToAddNewMemberToHousehold(householdId: UUID, by actor: User, user: User, role: MemberType) throws
    func addFeedingSchedule(to householdId: UUID, for pets: [Pet], intervals: [Interval], by householdAdmin: User) throws
}
