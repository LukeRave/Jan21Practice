import Foundation

// Testing via app delegate appDidFinishLaunching method

struct BarChartModel: Codable {
    let type: String
    let data: DataClass
}

struct DataClass: Codable {
    let labels: [Int]
    let datasets: [Dataset]
}

struct Dataset: Codable {
    let label: String
    let data: [Int]
}
