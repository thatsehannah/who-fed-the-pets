//
//  Household.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

@Observable class Household {
    var pets: [Pet]
    var creator: User
    var members: [User]
    var feedingSchedules: [FeedingSchedule]
    var currentFeedSchedules: [FeedingSchedule]
    var previousFeedingSchedules: [FeedingSchedule]
    
}
