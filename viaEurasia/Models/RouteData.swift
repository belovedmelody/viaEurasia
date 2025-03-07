import SwiftUI
import MapKit

struct Route: Identifiable, Hashable {
    let id: Int
    let name: String
    let length: Int // in kilometers
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageName: String
    let region: String
    let difficulty: RouteDifficulty
    let estimatedDays: Int?
    let startPoint: String
    let endPoint: String
    
    var imageNumber: String {
        "\(id)"
    }
    
    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.id == rhs.id
    }
}

enum RouteDifficulty: String {
    case easy = "Easy"
    case moderate = "Moderate"
    case challenging = "Challenging"
    case difficult = "Difficult"
}

// All routes data
let routes = [
    Route(
        id: 1,
        name: "Abraham's Path",
        length: 170,
        coordinates: CLLocationCoordinate2D(latitude: 37.1833, longitude: 38.7833),
        description: "Follow the footsteps of Abraham through ancient paths connecting historical sites and local communities. This cultural route offers insights into the shared heritage of different faiths.",
        imageName: "1",
        region: "Southeastern Anatolia",
        difficulty: .moderate,
        estimatedDays: 8,
        startPoint: "Şanlıurfa",
        endPoint: "Harran"
    ),
    Route(
        id: 2,
        name: "Carian Trail (Karia Yolu)",
        length: 820,
        coordinates: CLLocationCoordinate2D(latitude: 37.1871, longitude: 27.8459),
        description: "Turkey's longest coastal walking route, featuring ancient ruins, traditional villages, and stunning Mediterranean vistas. Experience the rich history of ancient Caria.",
        imageName: "2",
        region: "Aegean Coast",
        difficulty: .challenging,
        estimatedDays: 45,
        startPoint: "Bodrum",
        endPoint: "Dalyan"
    ),
    Route(
        id: 3,
        name: "Evliya Çelebi Way",
        length: 600,
        coordinates: CLLocationCoordinate2D(latitude: 40.7850, longitude: 29.4419),
        description: "Follow the 17th-century Ottoman traveler's route through northwestern Turkey, experiencing traditional hospitality and historical sites.",
        imageName: "3",
        region: "Northwestern Anatolia",
        difficulty: .moderate,
        estimatedDays: 25,
        startPoint: "Istanbul",
        endPoint: "Kütahya"
    ),
    Route(
        id: 4,
        name: "Gastronomy Route",
        length: 305,
        coordinates: CLLocationCoordinate2D(latitude: 38.4192, longitude: 27.1287),
        description: "A culinary journey through Turkey's Aegean region, showcasing local ingredients, traditional recipes, and food culture.",
        imageName: "4",
        region: "Aegean Region",
        difficulty: .easy,
        estimatedDays: 14,
        startPoint: "Izmir",
        endPoint: "Aydın"
    ),
    Route(
        id: 5,
        name: "Hittite Trail",
        length: 385,
        coordinates: CLLocationCoordinate2D(latitude: 40.1885, longitude: 35.2345),
        description: "Explore the ancient Hittite civilization through archaeological sites and historical landscapes in central Anatolia.",
        imageName: "5",
        region: "Central Anatolia",
        difficulty: .moderate,
        estimatedDays: 17,
        startPoint: "Hattuşa",
        endPoint: "Alacahöyük"
    ),
    Route(
        id: 6,
        name: "Independence Trail",
        length: 105,
        coordinates: CLLocationCoordinate2D(latitude: 41.1141, longitude: 32.6269),
        description: "Retrace the historic route used during the Turkish War of Independence, connecting important historical sites.",
        imageName: "6",
        region: "Black Sea Region",
        difficulty: .moderate,
        estimatedDays: 5,
        startPoint: "İnebolu",
        endPoint: "Kastamonu"
    ),
    Route(
        id: 7,
        name: "The Kaçkar",
        length: 154,
        coordinates: CLLocationCoordinate2D(latitude: 40.8375, longitude: 41.1609),
        description: "High-altitude trek through the Kaçkar Mountains, featuring alpine meadows, glacial lakes, and traditional Yayla culture.",
        imageName: "7",
        region: "Eastern Black Sea",
        difficulty: .difficult,
        estimatedDays: 8,
        startPoint: "Yusufeli",
        endPoint: "Çamlıhemşin"
    ),
    Route(
        id: 8,
        name: "Küre Mountains Trail",
        length: 762,
        coordinates: CLLocationCoordinate2D(latitude: 41.8069, longitude: 33.7147),
        description: "Long-distance trail through one of Turkey's most important national parks, showcasing rich biodiversity and cultural heritage.",
        imageName: "8",
        region: "Western Black Sea",
        difficulty: .challenging,
        estimatedDays: 38,
        startPoint: "Kastamonu",
        endPoint: "Cide"
    ),
    Route(
        id: 9,
        name: "Lycian Way",
        length: 540,
        coordinates: CLLocationCoordinate2D(latitude: 36.5552, longitude: 30.5513),
        description: "Turkey's first long-distance trail, following the ancient Lycian civilization's footsteps along the Mediterranean coast.",
        imageName: "9",
        region: "Mediterranean Coast",
        difficulty: .challenging,
        estimatedDays: 29,
        startPoint: "Fethiye",
        endPoint: "Antalya"
    ),
    Route(
        id: 10,
        name: "Mount Ararat",
        length: 28,
        coordinates: CLLocationCoordinate2D(latitude: 39.7019, longitude: 44.2983),
        description: "Climb Turkey's highest peak, a challenging ascent to the summit of the legendary Mount Ararat.",
        imageName: "10",
        region: "Eastern Anatolia",
        difficulty: .difficult,
        estimatedDays: 4,
        startPoint: "Doğubayazıt",
        endPoint: "Summit"
    ),
    Route(
        id: 11,
        name: "Phrygian Way",
        length: 506,
        coordinates: CLLocationCoordinate2D(latitude: 39.1667, longitude: 30.6667),
        description: "Journey through the ancient Phrygian civilization's heartland, featuring rock-cut monuments and historical sites.",
        imageName: "11",
        region: "Central Anatolia",
        difficulty: .moderate,
        estimatedDays: 27,
        startPoint: "Eskişehir",
        endPoint: "Afyonkarahisar"
    ),
    Route(
        id: 12,
        name: "Sarıkamış Trails",
        length: 256,
        coordinates: CLLocationCoordinate2D(latitude: 40.3317, longitude: 42.5922),
        description: "Winter sports and hiking trails through pristine forest landscapes, commemorating historical events.",
        imageName: "12",
        region: "Eastern Anatolia",
        difficulty: .moderate,
        estimatedDays: 12,
        startPoint: "Sarıkamış",
        endPoint: "Allahuekber Mountains"
    ),
    Route(
        id: 13,
        name: "St. Paul Trail",
        length: 500,
        coordinates: CLLocationCoordinate2D(latitude: 36.8875, longitude: 30.7033),
        description: "Follow the route of St. Paul's missionary journeys through ancient Roman roads and historical sites.",
        imageName: "13",
        region: "Mediterranean Region",
        difficulty: .challenging,
        estimatedDays: 27,
        startPoint: "Perge",
        endPoint: "Yalvaç"
    ),
    Route(
        id: 14,
        name: "Sufi Trail",
        length: 40,
        coordinates: CLLocationCoordinate2D(latitude: 40.9714, longitude: 29.0151),
        description: "A spiritual journey connecting important Sufi sites and cultural landmarks in Istanbul.",
        imageName: "14",
        region: "Marmara Region",
        difficulty: .easy,
        estimatedDays: 3,
        startPoint: "Üsküdar",
        endPoint: "Konya"
    ),
    Route(
        id: 15,
        name: "Sultans Trail",
        length: 120,
        coordinates: CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784),
        description: "Follow the Ottoman sultans' historical route through Istanbul's most significant cultural sites.",
        imageName: "15",
        region: "Istanbul",
        difficulty: .easy,
        estimatedDays: 6,
        startPoint: "Topkapı Palace",
        endPoint: "Edirne"
    ),
    Route(
        id: 16,
        name: "Troy Culture Route",
        length: 120,
        coordinates: CLLocationCoordinate2D(latitude: 39.9571, longitude: 26.2371),
        description: "Discover the legendary city of Troy and surrounding archaeological sites along the Aegean coast.",
        imageName: "16",
        region: "Northwestern Anatolia",
        difficulty: .moderate,
        estimatedDays: 7,
        startPoint: "Troy",
        endPoint: "Assos"
    ),
    Route(
        id: 17,
        name: "Via Egnatia",
        length: 90,
        coordinates: CLLocationCoordinate2D(latitude: 40.6401, longitude: 22.9444),
        description: "Ancient Roman road connecting important historical sites and cultural landmarks.",
        imageName: "17",
        region: "Thrace",
        difficulty: .moderate,
        estimatedDays: 5,
        startPoint: "Edirne",
        endPoint: "Istanbul"
    ),
    Route(
        id: 18,
        name: "Via Eurasia",
        length: 2800,
        coordinates: CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784),
        description: "Epic journey connecting Europe and Asia through historical trade routes and cultural landmarks.",
        imageName: "18",
        region: "Multiple Regions",
        difficulty: .difficult,
        estimatedDays: 150,
        startPoint: "Canterbury",
        endPoint: "Demre"
    ),
    Route(
        id: 19,
        name: "Yenice Forest Trails",
        length: 210,
        coordinates: CLLocationCoordinate2D(latitude: 41.2000, longitude: 32.3333),
        description: "Network of trails through pristine forest ecosystems, showcasing rich biodiversity.",
        imageName: "19",
        region: "Western Black Sea",
        difficulty: .moderate,
        estimatedDays: 10,
        startPoint: "Yenice",
        endPoint: "Karabük"
    ),
    Route(
        id: 20,
        name: "St. Nicholas Way",
        length: 160,
        coordinates: CLLocationCoordinate2D(latitude: 36.2603, longitude: 29.9826),
        description: "Pilgrimage route following the life and legacy of St. Nicholas through ancient Lycia.",
        imageName: "20",
        region: "Mediterranean Coast",
        difficulty: .moderate,
        estimatedDays: 8,
        startPoint: "Patara",
        endPoint: "Demre"
    )
] 