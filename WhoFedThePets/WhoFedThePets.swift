import SwiftUI

@main struct WhoFedThePets: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(\.householdRepository, MockHouseholdRepository(currentUser: MockUsers.user1))
    }
}
