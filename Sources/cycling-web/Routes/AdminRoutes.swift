import Foundation
import Kitura
import LoggerAPI


func addAdminRoutes(to router: Router) {
    router.get("/admin", handler: index)

    let rides = "/rides"
    router.get(rides, handler: getRides)
    router.get(rides, handler: getRide)
    router.post(rides, handler: addRide)
    router.put(rides, handler: updateRide)
    router.delete(rides, handler: deleteRide)

}

private func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    try response.render("login.stencil", context: [:])
}

private func getRides(profile: BasicAuth, completion: @escaping ([Ride]?, RequestError?) -> Void) {
    Ride.findAll(completion)
}

private func getRide(id: String, completion: @escaping (Ride?, RequestError?) -> Void) {
    Ride.find(id: id, completion)
}

private func addRide(ride: Ride, completion: @escaping (Ride?, RequestError?) -> Void) {
    var savedRide = ride
    savedRide.id = UUID().uuidString
    savedRide.save(completion)

    Log.info("Created ride with id \(savedRide.id ?? "")")
}

private func deleteRide(id: String, completion: @escaping (RequestError?) -> Void) {
    Ride.delete(id: id, completion)
}

private func updateRide(id: String, ride: Ride, completion: @escaping (Ride?, RequestError?) -> Void) {
    ride.update(id: id, completion)
}
