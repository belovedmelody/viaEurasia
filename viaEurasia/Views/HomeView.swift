import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Text
            Text("Welcome to Via Eurasia")
                .font(.title)
            
            // Feet Logo
            Image(systemName: "figure.hiking")
                .imageScale(.large)
                .font(.system(size: 60))
            
            // Disclaimer
            Text("Disclaimer: Please check local conditions before hiking")
                .font(.caption)
                .foregroundColor(.secondary)
            
            // Route Selection Button
            NavigationLink(destination: RoutesView()) {
                Text("Select Route")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview("Light Mode") {
    NavigationStack {
        HomeView()
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        HomeView()
    }
    .preferredColorScheme(.dark)
} 