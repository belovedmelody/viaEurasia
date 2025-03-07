import SwiftUI

struct PointOfInterest {
    let name: String
    let type: String // We can categorize these later
    let distance: Double // We can add actual distances later
}

struct PointsOfInterestView: View {
    @State private var selectedFilters: Set<String> = ["All"]
    let filters = ["All", "Village", "Town", "Camping", "Water"]
    
    let points = [
        PointOfInterest(name: "Misi", type: "Village", distance: 2.5),
        PointOfInterest(name: "Gümüstepe", type: "Village", distance: 3.2),
        PointOfInterest(name: "Kadriye", type: "Village", distance: 4.1),
        PointOfInterest(name: "Güngörenkoy", type: "Village", distance: 5.8),
        PointOfInterest(name: "Maksempinar Village", type: "Village", distance: 6.3),
        PointOfInterest(name: "Akçalar", type: "Village", distance: 7.4),
        PointOfInterest(name: "Gölyazi", type: "Village", distance: 8.9),
        PointOfInterest(name: "Çali Köy", type: "Village", distance: 9.2),
        PointOfInterest(name: "Atlas", type: "Village", distance: 10.5),
        PointOfInterest(name: "Inegazi", type: "Village", distance: 11.8)
    ]
    
    private var isFiltering: Bool {
        !(selectedFilters.count == 1 && selectedFilters.contains("All"))
    }
    
    var body: some View {
        List {
            ForEach(points, id: \.name) { point in
                VStack(alignment: .leading, spacing: 8) {
                    Text(point.name)
                        .font(.headline)
                    
                    HStack {
                        Text("\(String(format: "%.1f", point.distance)) km away")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        // Amenity icons
                        HStack(spacing: 12) {
                            Image(systemName: "bed.double.fill")
                            Image(systemName: "fork.knife")
                            Image(systemName: "bus.fill")
                        }
                        .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Points of Interest")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    ForEach(filters, id: \.self) { filter in
                        Button {
                            toggleFilter(filter)
                        } label: {
                            HStack {
                                Text(filter)
                                if selectedFilters.contains(filter) {
                                    Spacer()
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                } label: {
                    Image(systemName: isFiltering ? 
                          "line.3.horizontal.decrease.circle.fill" : 
                          "line.3.horizontal.decrease.circle"
                    )
                }
            }
        }
    }
    
    private func toggleFilter(_ filter: String) {
        if filter == "All" {
            selectedFilters = ["All"]
        } else {
            selectedFilters.remove("All")
            if selectedFilters.contains(filter) {
                selectedFilters.remove(filter)
                if selectedFilters.isEmpty {
                    selectedFilters.insert("All")
                }
            } else {
                selectedFilters.insert(filter)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PointsOfInterestView()
    }
} 