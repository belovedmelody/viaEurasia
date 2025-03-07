import SwiftUI

struct AssignmentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Project Context
                Group {
                    Text("Project Context")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("The NGO Culture Routes Society hired designers to revitalize the Via Eurasia app following a recent acquisition that provided additional budget. The project involves working with a copywriter to implement user feedback in the new design.")
                }
                
                // User Feedback
                Group {
                    Text("User Feedback")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        BulletPoint("Navigation within the app is confusing")
                        BulletPoint("There are more screens than necessary")
                        BulletPoint("The branding and color feel dated and unsophisticated, and they don't follow accessibility guidelines")
                    }
                }
                
                // Creative Director Notes
                Group {
                    Text("Creative Director Notes")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        BulletPoint("Move sponsor logos and information from Home to About page")
                        BulletPoint("Create an impactful Welcome page to replace Home")
                        BulletPoint("Replace Check Before You Go with a new menu")
                        BulletPoint("Keep Inter as brand typeface but adjust for better hierarchy")
                        BulletPoint("Update brand colors for accessibility compliance")
                        BulletPoint("Consider adding hamburger menu or bottom bar navigation")
                    }
                }
                
                // Implementation Notes
                Group {
                    Text("Implementation Notes")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("The redesign maintains the original components while introducing new versions, allowing for before/after comparisons. All changes prioritize accessibility and intuitive navigation while preserving the app's core functionality.")
                }
            }
            .padding()
        }
        .navigationTitle("Assignment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BulletPoint: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text("•")
                .font(.title3)
            Text(text)
        }
    }
}

#Preview("Light Mode") {
    NavigationStack {
        AssignmentView()
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        AssignmentView()
    }
    .preferredColorScheme(.dark)
} 