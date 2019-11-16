import Foundation
import Kitura
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

        do {
            try response.render("rides.stencil", context: ["rides": rides])
        } catch {
            response.status(.internalServerError).send(error.localizedDescription)
        }
    }
}
