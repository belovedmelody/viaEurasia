import SwiftUI
import MapKit

struct MapHomeView: View {
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.9334, longitude: 32.8597), // Center on Turkey
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    ))
    @State private var sheetHeight: PresentationDetent = .medium
    @State private var selectedRoute: Route?
    
    private let defaultRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.9334, longitude: 32.8597),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    var body: some View {
        Map(position: $position, selection: $selectedRoute) {
            ForEach(routes) { route in
                Marker(route.name, coordinate: route.coordinates)
                    .tint(Color.accentColor)
                    .tag(route)
            }
        }
        .mapStyle(.standard)
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .safeAreaInset(edge: .leading) {
            Color.clear.frame(width: 16)
        }
        .safeAreaInset(edge: .trailing) {
            Color.clear.frame(width: 0)
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 80)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 100)
        }
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                RoutesListView(sheetHeight: $sheetHeight, mapPosition: $position, selectedRoute: $selectedRoute, defaultRegion: defaultRegion)
            }
            .presentationDetents([.height(100), .medium, .large], selection: $sheetHeight)
            .presentationDragIndicator(.visible)
            .presentationBackgroundInteraction(.enabled(upThrough: .height(100)))
            .interactiveDismissDisabled()
        }
        .onChange(of: selectedRoute) { _, route in
            if let route = route {
                withAnimation {
                    position = .region(MKCoordinateRegion(
                        center: route.coordinates,
                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                    ))
                }
                sheetHeight = .medium
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    MapHomeView()
} 
