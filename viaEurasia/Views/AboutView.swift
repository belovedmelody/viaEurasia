import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Carousel
                TabView {
                    ForEach(1...3, id: \.self) { index in
                        Rectangle() // Placeholder for actual images
                            .fill(Color(uiColor: .secondarySystemBackground))
                            .frame(height: 200)
                            .overlay(
                                Text("Via Eurasia Countries \(index)")
                                    .foregroundColor(.secondary)
                            )
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
                
                // Text Content
                Group {
                    Text("The Via Eurasia Association was formed in early 2020 by the partners who first worked together on the formation of the Cultural Route of the Via Eurasia. The eastern Mediterranean and Balkans region contains one of the oldest, most intensive and valuable road networks in the world, representing the works of many cultures and civilisations, and established over many thousands of years. The Cultural Association of The Via Eurasia is formed to make a Cultural Route knows as the Via Eurasia, consisting of a network of ancient roads of representative periods and styles and initially extending from Rome in Italy to Demre in Turkey.")
                        .padding(.bottom)
                    
                    Text("About the Via Eurasia")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    Text("The VIA EURASIA is an ambitious, long-distance cultural route running from Canterbury in the UK to Rome, across Italy and the Balkans, through western Turkey to Demre on the Lycian coast of Turkey's southwest... and beyond. The VIA EURASIA links together a number of cultural routes including: Via Francegina del Sud, Via Egnati, Sultans Trail, Tolerance Way, Evliya Çelebi Way, Phrygian Way, St Paul Trail, Lycian Way. The VIA EURASIA extends from the north-western most limit of Europe to its eastern edge, and links diverse cultures and landscapes in a unified whole. It tracks through ancient kingdoms and colonies, and along Muslim and Christian pilgrimage and faith routes. The initial and final stages of the VIA EURASIA—the Via Francegina and the Lycian Way—are already very popular trails.")
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Via Eurasia")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("Light Mode") {
    NavigationStack {
        AboutView()
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        AboutView()
    }
    .preferredColorScheme(.dark)
} 