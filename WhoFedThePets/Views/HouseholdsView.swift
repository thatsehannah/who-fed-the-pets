//
//  HouseholdsView.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/22/26.
//

import SwiftUI

struct HouseholdsView: View {
    @Environment(\.householdRepository) private var repository
    
    var body: some View {
        NavigationStack {
            Text("\(repository.currentUser.firstName)'s Household")
                .font(.largeTitle.bold())
            List {
                ForEach(repository.households) { household in
                    HStack {
                        Text(household.name)
                            .font(.title)
                        if repository.currentUser.id == household.creator.id {
                            Spacer()
                            Text("👑")
                                .font(.title2.bold())
                        }
                    }
                    
                }
            }
        }
    }
}


#Preview {
    HouseholdsView()
        .environment(\.householdRepository, MockHouseholdRepository(currentUser: MockUsers.user1))
}
