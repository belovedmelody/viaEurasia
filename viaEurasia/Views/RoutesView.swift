import SwiftUI

struct RoutesView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<5) { index in
                    TrailListingView()
                }
            }
            .padding()
        }
        .navigationTitle("Routes")
    }
}

struct TrailListingView: View {
    let gradientColors: [(Color, Color)] = [
        (Color(red: 0.2, green: 0.8, blue: 0.2), Color(red: 0.1, green: 0.6, blue: 0.1)), // Green
        (Color(red: 1.0, green: 0.8, blue: 0.0), Color(red: 1.0, green: 0.6, blue: 0.0)), // Yellow
        (Color(red: 0.0, green: 0.6, blue: 1.0), Color(red: 0.0, green: 0.4, blue: 0.8)), // Blue
        (Color(red: 1.0, green: 0.4, blue: 0.7), Color(red: 0.8, green: 0.2, blue: 0.5)), // Pink
        (Color(red: 1.0, green: 0.8, blue: 0.0), Color(red: 0.8, green: 0.6, blue: 0.0))  // Gold
    ]
    
    var body: some View {
        NavigationLink(destination: RouteDetailView()) {
            VStack(alignment: .leading, spacing: 10) {
                // Photo with gradient
                LinearGradient(
                    gradient: Gradient(colors: [gradientColors[Int.random(in: 0..<gradientColors.count)].0,
                                              gradientColors[Int.random(in: 0..<gradientColors.count)].1]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Image(systemName: "mountain.2.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white.opacity(0.8))
                )
                
                // Trail Info
                VStack(alignment: .leading, spacing: 5) {
                    Text("Trail #\(Int.random(in: 1...100))")
                        .font(.headline)
                    Text("Trail Title")
                        .font(.title3)
                    Text("Length: \(Int.random(in: 5...20)) km")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(15)
            .shadow(radius: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    Group {
        RoutesView()
            .previewDisplayName("Light Mode")
        
        RoutesView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
    }
} 