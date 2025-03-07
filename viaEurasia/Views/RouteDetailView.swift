import SwiftUI
import MapKit

struct TrailLocation {
    let name: String
    let coordinates: CLLocationCoordinate2D
    let zoomLevel: Double // for span
}

let trailLocations: [TrailLocation] = [
    TrailLocation(
        name: "Abraham's Path",
        coordinates: CLLocationCoordinate2D(latitude: 37.1833, longitude: 38.7833), // Starts in Urfa/Sanliurfa
        zoomLevel: 0.5
    ),
    TrailLocation(
        name: "Carian Trail (Karia Yolu)",
        coordinates: CLLocationCoordinate2D(latitude: 37.1871, longitude: 27.8459), // Starts near Bodrum
        zoomLevel: 0.3
    ),
    TrailLocation(
        name: "Evliya Çelebi Way (Evliya Çelebi Yolu)",
        coordinates: CLLocationCoordinate2D(latitude: 40.7850, longitude: 29.4419), // Starts in Hersek
        zoomLevel: 0.3
    ),
    TrailLocation(
        name: "Lycian Way (Likya Yolu)",
        coordinates: CLLocationCoordinate2D(latitude: 36.5552, longitude: 30.5513), // Starts in Fethiye
        zoomLevel: 0.3
    ),
    TrailLocation(
        name: "St. Paul Trail (Aziz Paul Yolu)",
        coordinates: CLLocationCoordinate2D(latitude: 36.8875, longitude: 30.7033), // Starts in Perge near Antalya
        zoomLevel: 0.3
    ),
    // Default coordinates for trails where exact trailhead is uncertain
    TrailLocation(
        name: "Default",
        coordinates: CLLocationCoordinate2D(latitude: 39.9334, longitude: 32.8597), // Ankara center as fallback
        zoomLevel: 0.5
    )
]

struct RouteDetailView: View {
    let route: Route
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedRoute: Route?
    var showBackButton: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Hero Image
                GeometryReader { geometry in
                    Image(route.imageNumber)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 250)
                        .clipped()
                }
                .frame(height: 250)
                
                VStack(alignment: .leading, spacing: 16) {
                    // Route Info Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text(route.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 16) {
                            Label("\(route.length) km", systemImage: "figure.hiking")
                                .font(.system(size: 19))
                            Label("18°C", systemImage: "thermometer.sun")
                            Label("Partly Cloudy", systemImage: "cloud.sun.fill")
                        }
                        .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Route Description
                    Text(route.description)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Divider()
                    
                    // Route Details
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Route Details")
                            .font(.headline)
                        
                        DetailRow(title: "Region", value: route.region)
                        DetailRow(title: "Start", value: route.startPoint)
                        DetailRow(title: "End", value: route.endPoint)
                    }
                    
                    // Action Buttons
                    VStack(spacing: 12) {
                        ActionButton(title: "Route Updates", icon: "bell.badge", action: {})
                        ActionButton(title: "GuideBook", icon: "book", action: {})
                        ActionButton(title: "Points of Interest", icon: "mappin.and.ellipse", action: {})
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(showBackButton)
        .toolbar {
            if showBackButton {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        selectedRoute = nil
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                    }
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
        }
    }
}

struct ActionButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Label(title, systemImage: icon)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        RouteDetailView(route: routes[0], selectedRoute: .constant(nil))
    }
} 