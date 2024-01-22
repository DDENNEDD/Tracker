import Foundation

struct Tracker {
    let trackerId: UInt
    let name: String
    let color: String
    let emoji: String
    let schedule: [String: String]

    init(trackerId: UInt, name: String, color: String, emoji: String, schedule: [String: String]) {
        self.trackerId = trackerId
        self.name = name
        self.color = color
        self.emoji = emoji
        self.schedule = schedule
    }
}
