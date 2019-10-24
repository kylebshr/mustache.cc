import Foundation
import Kitura
import KituraCompression
import KituraStencil

final class Application {

    private let router = Router()

    init(port: Int? = ProcessInfo.processInfo.environment["PORT"].flatMap(Int.init)) {

        router.all(middleware: Compression())
        router.add(templateEngine: StencilTemplateEngine())

        let options = StaticFileServer.Options(serveIndexForDirectory: false)
        router.all("/assets", middleware: StaticFileServer(path: "./assets", options: options))

        router.get("/", handler: rides)

        let port = port ?? 8080

        Kitura.addHTTPServer(onPort: port, with: router)
    }

    func run() {
        Kitura.run()
    }

    private func rides(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        let ride = Ride(title: "Saturday, Oct. 26: Mill Valley")

        try response.render("rides.stencil", with: ride)
        response.status(.OK)
        next()
    }
}
