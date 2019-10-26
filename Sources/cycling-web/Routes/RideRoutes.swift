import Foundation
import Kitura


func addRideRoutes(to router: Router) {
    router.get("/", handler: index)
    router.post("/ride", handler: addRide)
}

private func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {

    Ride.findAll { rides, error in
        guard let rides = rides else {
            let error = "Service unavailable:" + "\(String(describing: error?.localizedDescription))"
            response.status(.serviceUnavailable).send(json: ["Message": error])
            return
        }

        do {
            try response.render("rides.stencil", context: ["rides": rides])
            response.status(.OK)
        } catch {
            response.status(.internalServerError).send(error.localizedDescription)
        }
    }

}

private func addRide(ride: Ride, completion: @escaping (Ride?, RequestError?) -> Void) {
    var savedRide = ride
    savedRide.id = UUID().uuidString
    savedRide.save(completion)
}
