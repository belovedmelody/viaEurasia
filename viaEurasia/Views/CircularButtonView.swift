import SwiftUI

struct CircularButtonView: View {
    let symbol: String
    let label: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    init(
        symbol: String,
        label: String,
        backgroundColor: Color = .accentColor,
        foregroundColor: Color = .white,
        action: @escaping () -> Void = {}
    ) {
        self.symbol = symbol
        self.label = label
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Button(action: action) {
                buttonContent
            }
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .frame(width: 80)
    }
    
    private var buttonContent: some View {
        Image(systemName: symbol)
            .font(.system(size: 24))
            .foregroundColor(foregroundColor)
            .frame(width: 60, height: 60)
            .background(backgroundColor)
            .clipShape(Circle())
    }
}

// Navigation version
struct NavigatingCircularButtonView<Destination: View>: View {
    let symbol: String
    let label: String
    let backgroundColor: Color
    let foregroundColor: Color
    let destination: () -> Destination
    
    init(
        symbol: String,
        label: String,
        backgroundColor: Color = .accentColor,
        foregroundColor: Color = .white,
        destination: @escaping () -> Destination
    ) {
        self.symbol = symbol
        self.label = label
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.destination = destination
    }
    
    var body: some View {
        VStack(spacing: 8) {
            NavigationLink(destination: destination) {
                Image(systemName: symbol)
                    .font(.system(size: 24))
                    .foregroundColor(foregroundColor)
                    .frame(width: 60, height: 60)
                    .background(backgroundColor)
                    .clipShape(Circle())
            }
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .frame(width: 80)
    }
}

#Preview {
    HStack(spacing: 20) {
        CircularButtonView(symbol: "map.fill", label: "Map")
        CircularButtonView(symbol: "location.fill", label: "Location")
        CircularButtonView(symbol: "star.fill", label: "Favorites")
        NavigatingCircularButtonView(
            symbol: "mappin",
            label: "Points",
            destination: { Text("Destination") }
        )
    }
    .padding()
} 