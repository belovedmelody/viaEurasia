import SwiftUI

struct CheckBeforeYouGoView: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(["Route Updates", "Weather", "GuideBook"], id: \.self) { item in
                Button(action: {}) {
                    HStack {
                        Text(item)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .navigationTitle("Check Before You Go")
    }
}

#Preview {
    CheckBeforeYouGoView()
} 