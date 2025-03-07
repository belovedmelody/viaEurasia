import SwiftUI

struct LanguageSettingsView: View {
    @State private var selectedLanguage = "English"
    let languages = ["English", "Türkçe"]
    
    var body: some View {
        List {
            ForEach(languages, id: \.self) { language in
                HStack {
                    Text(language == "English" ? "🇪🇺" : "🇹🇷")
                        .font(.title2)
                    Text(language)
                    Spacer()
                    if selectedLanguage == language {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedLanguage = language
                }
            }
        }
        .navigationTitle("Language")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LanguageSettingsView()
    }
} 