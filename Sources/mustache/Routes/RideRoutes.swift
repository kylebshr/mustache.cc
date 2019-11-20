import Foundation
import Kitura
import SwiftKueryORM
import LoggerAPI

func addRideRoutes(to router: Router) {
    router.get("/", handler: index)
}

private func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Ride.findAll { rides, error in
        guard let rides = rides else {
            let error = "Service unavailable: \(String(describing: error?.localizedDescription))"
            response.status(.serviceUnavailable).send(json: ["Message": error])
            return
        }

        guard let today = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) else {
            let error = "Service unavailable: unable to load rides"
            response.status(.serviceUnavailable).send(json: ["Message": error])
            return
        }

        let currentRides = rides.filter {
            $0.date >= today
        }

        do {
            try response.render("rides.stencil", context: ["rides": currentRides])
        } catch {
            response.status(.internalServerError).send(error.localizedDescription)
        }
    }
}
