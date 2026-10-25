//
//  ViewExtensions.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/24/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var householdRepository: any HouseholdRepositoryProtocol = MockHouseholdRepository(currentUser: MockUsers.user1)
}
