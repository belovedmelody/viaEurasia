import SwiftUI

struct WelcomeView: View {
    @State private var showingMap = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Hero Image/Gradient
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .green]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 200)
                    .overlay {
                        VStack {
                            Image(systemName: "figure.hiking")
                                .font(.system(size: 60))
                                .foregroundColor(.white)
                            Text("Via Eurasia")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 24) {
                        // Introduction
                        Text("Welcome to Via Eurasia")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Explore one of the world's oldest and most valuable road networks, stretching from Canterbury to Demre. This cultural route connects diverse landscapes and historical paths across Europe and Asia Minor.")
                        
                        // Key Features
                        Text("App Features")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            FeatureRow(icon: "map.fill", title: "20 Cultural Routes", description: "Access detailed trail information and maps")
                            FeatureRow(icon: "location.fill", title: "Points of Interest", description: "Discover historical sites and facilities along the way")
                            FeatureRow(icon: "cloud.sun.fill", title: "Trail Conditions", description: "Check weather and route updates")
                            FeatureRow(icon: "book.fill", title: "Digital Guidebook", description: "Access comprehensive trail guides")
                        }
                        
                        // Get Started Button
                        Button {
                            withAnimation {
                                showingMap = true
                            }
                        } label: {
                            Text("Explore Routes")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                        .padding(.top)
                    }
                    .padding()
                }
            }
            
            if showingMap {
                MapHomeView()
            }
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.accentColor)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    WelcomeView()
} 