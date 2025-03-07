import SwiftUI
import MapKit

struct RoutesListView: View {
    @Binding var sheetHeight: PresentationDetent
    @Binding var mapPosition: MapCameraPosition
    @Binding var selectedRoute: Route?
    let defaultRegion: MKCoordinateRegion
    @State private var showingSettings = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Group {
            if let route = selectedRoute {
                RouteDetailView(route: route, selectedRoute: $selectedRoute)
                    .onDisappear {
                        withAnimation {
                            mapPosition = .region(defaultRegion)
                        }
                    }
            } else {
                VStack(spacing: 0) {
                    Spacer()
                    // Custom Title Header
                    HStack {
                        Text("Routes")
                            .font(.title.bold())
                        Spacer()
                        Button {
                            showingSettings = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(uiColor: .systemBackground))
                    
                    // List Content
                    List {
                        ForEach(routes) { route in
                            Button {
                                selectedRoute = route
                                withAnimation {
                                    mapPosition = .region(MKCoordinateRegion(
                                        center: route.coordinates,
                                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                                    ))
                                }
                                sheetHeight = .medium
                            } label: {
                                HStack(spacing: 16) {
                                    // Route Info
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(route.name)
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                        Text("\(route.length) km")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    // Route Image
                                    Image(route.imageNumber)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                                .padding(.vertical, 8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .sheet(isPresented: $showingSettings) {
            NavigationStack {
                SettingsView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RoutesListView(
            sheetHeight: .constant(.medium),
            mapPosition: .constant(.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 39.9334, longitude: 32.8597),
                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
            ))),
            selectedRoute: .constant(nil),
            defaultRegion: MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 39.9334, longitude: 32.8597),
                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
            )
        )
    }
} 
