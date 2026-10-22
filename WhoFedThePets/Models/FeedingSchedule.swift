//
//  FeedingSchedule.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

enum IntervalError: Error {
    case overload
}

struct FeedingSchedule: Identifiable {
    var id: UUID = UUID()
    var pets: [Pet]
    var intervals: [Interval]
    var date: Date
    var createdOn: Date
    
    init(pets: [Pet], intervals: [Interval]) {
        self.pets = pets
        self.intervals = intervals
        self.date = Date.now
        self.createdOn = Date.now
    }
    
    mutating func addPets(_ pet: Pet) {
        pets.append(pet)
    }
    
    mutating func addIntervalToSchedule(_ interval: Interval) throws {
        guard self.intervals.count < 6 else { throw IntervalError.overload}
        
        self.intervals.append(interval)
    }
}
