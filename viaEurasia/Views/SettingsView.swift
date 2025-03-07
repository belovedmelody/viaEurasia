import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showingWelcome = false
    
    var body: some View {
        List {
            Section {
                NavigationLink(destination: AboutView()) {
                    Label("About", systemImage: "info.circle")
                }
                
                NavigationLink(destination: LegalView()) {
                    Label("Legal", systemImage: "doc.text")
                }
                
                NavigationLink(destination: AssignmentView()) {
                    Label("Assignment", systemImage: "doc.text.below.ecg")
                }
                
                NavigationLink(destination: LanguageSettingsView()) {
                    Label("Language", systemImage: "globe")
                }
            }
            
            Section {
                Button {
                    showingWelcome = true
                } label: {
                    Text("Show Welcome Screen")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .fullScreenCover(isPresented: $showingWelcome) {
            WelcomeView()
        }
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