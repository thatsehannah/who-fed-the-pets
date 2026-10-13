//
//  Pet.swift
//  MyApp
//
//  Created by Elliot Hannah III on 10/13/26.
//

import Foundation

enum PetType: String {
    case cat
    case dog
    case fish
    case rabbit
    case goat
    case iguana
    case hamster
    case turtle
    case bird
    case snake
}

enum Gender: String {
    case male
    case female
}

@Observable class Pet: Identifiable {
    var name: String
    var type: PetType
    var age: Int
    var color: String
    var gender: Gender
    var lastFed: Date
    
    init(name: String, type: PetType, age: Int, color: String, gender: Gender, lastFed: Date) {
        self.name = name
        self.type = type
        self.age = age
        self.color = color
        self.gender = gender
        self.lastFed = lastFed
    }
}

