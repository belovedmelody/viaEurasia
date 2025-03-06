import SwiftUI
import MapKit

struct RouteDetailView: View {
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.925533, longitude: 32.866287), // Ankara coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ))
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("Trail #1: Trans Mysia Way")
                    .font(.title)
                    .padding(.horizontal)
                
                // Route Map
                Map(position: $position) {
                    Marker("Trail Location", coordinate: CLLocationCoordinate2D(latitude: 39.925533, longitude: 32.866287))
                }
                .frame(height: 300)
                .cornerRadius(10)
                .padding(.horizontal)
                
                // Action Buttons
                HStack(alignment: .top, spacing: 20) {
                    CircularButtonView(symbol: "exclamationmark.bubble.fill", label: "Route Updates")
                    CircularButtonView(symbol: "cloud.sun.fill", label: "Weather")
                    CircularButtonView(symbol: "book.fill", label: "GuideBook")
                    NavigatingCircularButtonView(
                        symbol: "mappin",
                        label: "Points of Interest",
                        destination: { PointsOfInterestView() }
                    )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
                // Description
                Text("This part of the Trans Mysia Way runs over on old forest paths. It starts from the upper part of the village of Misi and mainly follows established forest paths and rising steeply through pine forests. It passes around dağyenice village before ending on Doğanci ridge above Dağyenice lake. A spring on the Dağyenice road marks the end of the trail.")
                    .padding(.horizontal)
                
                // Distance
                Text("Distance: 15 km")
                    .font(.headline)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("Route Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "location.fill")
                }
            }
        }
    }
}

#Preview {
    RouteDetailView()
} 