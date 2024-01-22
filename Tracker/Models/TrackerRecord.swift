import Foundation

struct TrackerRecord {
    let trackerId: UInt
    let date: Date

    init(trackerId: UInt, date: Date) {
        self.trackerId = trackerId
        self.date = date
    }
}
