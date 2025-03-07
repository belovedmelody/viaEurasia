import SwiftUI

struct RoutesView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(routes) { route in
                    TrailListingView(route: route)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Routes")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape.fill")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: MapHomeView()) {
                    Image(systemName: "map.fill")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct TrailListingView: View {
    let route: Route
    @State private var selectedRoute: Route?
    
    var body: some View {
        NavigationLink(destination: RouteDetailView(route: route, selectedRoute: $selectedRoute, showBackButton: false)) {
            VStack(alignment: .leading, spacing: 0) {
                // Photo with trailing crop
                GeometryReader { geometry in
                    Image(route.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 200)
                        .clipped()
                        .alignmentGuide(.trailing) { d in d[.trailing] }
                }
                .frame(height: 200)
                
                // Trail Info
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(route.id). \(route.name)")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(route.length > 0 ? "\(route.length) km" : "Length unknown")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(15)
            .shadow(radius: 5)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
    }
}

#Preview("Light Mode") {
    NavigationStack {
        RoutesView()
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        RoutesView()
    }
    .preferredColorScheme(.dark)
} 