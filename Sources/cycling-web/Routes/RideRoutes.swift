import Foundation
import Kitura


func addRideRoutes(to router: Router) {
    router.get("/", handler: index)
    router.post("/ride", handler: addRide)
}

private func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    try response.render("rides.stencil", context: ["rides": upcomingRides])
    response.status(.OK)
    next()
}

private func addRide(ride: Ride, completion: @escaping (Ride?, RequestError?) -> Void) {
    var savedRide = ride
    savedRide.id = UUID().uuidString
    savedRide.save(completion)
}
