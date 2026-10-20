//
//  Interval.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

struct Interval: Identifiable {
    var id: UUID = UUID()
    var fedBy: HouseholdMember?
    var missed: Bool?
    var fedAt: Date?
    var timeToFeed: Date?
    var appointee: HouseholdMember?
    var createdOn: Date
    
    init(missed: Bool? = nil, fedAt: Date? = nil, timeToFeed: Date? = nil) {
        self.fedBy = nil
        self.missed = nil
        self.fedAt = nil
        self.timeToFeed = timeToFeed
        self.appointee = nil
        self.createdOn = Date.now
    }
    
    // TODO: func for admin user to appoint user from household to
    mutating func appoint(user target: HouseholdMember, by appointer: HouseholdMember) {
        guard appointer.role != .admin else { return }
        
        self.appointee = target
    }
    
    // TODO: func for logging feed
    mutating func logFeed(feeder member: HouseholdMember) {
        self.fedAt = Date.now
        self.fedBy = member
        self.missed = false
    }
    
}
