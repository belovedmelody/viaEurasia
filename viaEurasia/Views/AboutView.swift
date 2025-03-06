import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Carousel
                TabView {
                    ForEach(0..<3) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .cornerRadius(10)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
                
                // Text Content
                VStack(alignment: .leading, spacing: 15) {
                    Text("About Via Eurasia")
                        .font(.title)
                    
                    Text("The Via Eurasia Association was formed in early 2020 by the partners who first worked together on the formation of the Cultural Route of the Via Eurasia. The eastern Mediterranean and Balkans region contains one of the oldest, most intensive and valuable road networks in the world, representing the works of many cultures and civilisations, and established over many thousands of years.")
                    
                    Text("The Cultural Association of The Via Eurasia is formed to make a Cultural Route knows as the Via Eurasia, consisting of a network of ancient roads of representative periods and styles and initially extending from Rome in Italy to Demre in Turkey.")
                }
                .padding()
            }
        }
        .navigationTitle("About Via Eurasia")
    }
}

#Preview {
    AboutView()
} 