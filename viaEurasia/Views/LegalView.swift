import SwiftUI

struct LegalView: View {
    let logoSymbols = [
        "building.columns.fill",      // Institution/Government
        "leaf.fill",                  // Environmental/Nature
        "globe.europe.africa.fill",   // International/EU
        "hands.and.sparkles.fill",    // Community/Support
        "flag.2.crossed.fill",        // Partnership/Collaboration
        "building.2.fill"             // Organization/Foundation
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Flags
                HStack {
                    Image(systemName: "flag.fill")
                        .imageScale(.large)
                }
                
                // Funding Text
                VStack(spacing: 10) {
                    Text("Bu proje Avrupa Birligi tarafindan finanse edilmektedir.")
                        .multilineTextAlignment(.center)
                    Text("This project is funded by the European Union.")
                        .multilineTextAlignment(.center)
                }
                
                // Hiking Symbol
                Image(systemName: "figure.hiking")
                    .imageScale(.large)
                    .font(.system(size: 60))
                
                // Disclaimer
                VStack(spacing: 20) {
                    Text("Bu mobil uygulama Avrupa Birliği'nin maddi desteği ile hazirlanmiştir. içerik tamamiyla Kültür Rotalari Derneği sorumluluğu altindadir ve Avrupa Berliği'ningörüşlerini yansitmak zorunda değildir.")
                        .multilineTextAlignment(.center)
                    
                    Text("This app was produced with the financial support of the European Union. Its contents are the sole responsibility of Cultural Routes Society and do not necessarily reflect the views of the European Union.")
                        .multilineTextAlignment(.center)
                }
                
                // Logos Grid
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(logoSymbols, id: \.self) { symbol in
                        Image(systemName: symbol)
                            .imageScale(.large)
                            .font(.system(size: 40))
                            .foregroundColor(.accentColor)
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Legal")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("Light Mode") {
    NavigationStack {
        LegalView()
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        LegalView()
    }
    .preferredColorScheme(.dark)
} 
