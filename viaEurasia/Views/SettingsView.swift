import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            NavigationLink(destination: AboutView()) {
                Label("About", systemImage: "info.circle")
            }
            
            NavigationLink(destination: LegalView()) {
                Label("Legal", systemImage: "doc.text")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview("Light Mode") {
    NavigationStack {
        SettingsView()
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        SettingsView()
    }
    .preferredColorScheme(.dark)
} 