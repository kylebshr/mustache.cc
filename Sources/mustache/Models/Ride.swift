import Foundation
import SwiftKueryORM

struct Ride: Model {
    var id: String? = nil
    var date: Date
    var title: String
    var location: String
    var miles: Int
    var elevation: Int
    var difficulty: String
    var description: String
    var imageName: String
    var link: URL
}
