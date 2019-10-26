import Foundation
import Kitura
import LoggerAPI


func addAdminRoutes(to router: Router) {
    router.get("/admin", handler: index)
}

private func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    try response.render("login.stencil", context: [:])
}
