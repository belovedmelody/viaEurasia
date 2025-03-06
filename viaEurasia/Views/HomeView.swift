import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Flags
            HStack {
                Image(systemName: "flag.fill")
                    .imageScale(.large)
                Text("Flags")
                    .font(.title2)
            }
            
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
                .foregroundColor(.gray)
            
            // Route Selection Button
            NavigationLink(destination: RoutesView()) {
                Text("Select Route")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // CollectionView (3x2 Logos)
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(0..<6) { index in
                    Image(systemName: "mountain.2.fill")
                        .imageScale(.large)
                        .font(.system(size: 40))
                        .frame(height: 80)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    HomeView()
} 