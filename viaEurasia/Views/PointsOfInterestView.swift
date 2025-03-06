import SwiftUI

struct PointsOfInterestView: View {
    var body: some View {
        VStack {
            // Filter Options
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(["All", "Village", "Town"], id: \.self) { filter in
                        Text(filter)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
            
            // Points List
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(0..<10) { index in
                        PointOfInterestRow()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Points of Interest")
    }
}

struct PointOfInterestRow: View {
    var body: some View {
        HStack(spacing: 15) {
            // Avatar
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 60)
            
            // Info
            VStack(alignment: .leading, spacing: 5) {
                Text("Point of Interest")
                    .font(.headline)
                Text("2.5 km away")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Symbols
            VStack(spacing: 10) {
                Image(systemName: "bed.double.fill")
                Image(systemName: "fork.knife")
                Image(systemName: "bus.fill")
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview("Light Mode") {
    PointsOfInterestView()
}

#Preview("Dark Mode") {
    PointsOfInterestView()
        .preferredColorScheme(.dark)
} 