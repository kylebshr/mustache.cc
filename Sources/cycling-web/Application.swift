import Foundation
import Kitura
import KituraCompression
import KituraStencil
import Stencil

final class Application {

    private let router = Router()

    init(port: Int? = ProcessInfo.processInfo.environment["PORT"].flatMap(Int.init)) {
        router.all(middleware: Compression())

        configureStencil()
        configureAssets()

        Persistence.setUp()

        addRideRoutes(to: router)

        let port = port ?? 8080
        Kitura.addHTTPServer(onPort: port, with: router)
    }

    func run() {
        Kitura.run()
    }

    private func configureAssets() {
        let options = StaticFileServer.Options(serveIndexForDirectory: false)
        router.all("/assets", middleware: StaticFileServer(path: "./assets", options: options))
    }

    private func configureStencil() {
        let ext = Extension()
        ext.registerFilter("titleDateFormatter", filter: Filter.titleDateFormatter)
        ext.registerFilter("meetupTimeFormatter", filter: Filter.meetupTimeFormatter)

        let engine = StencilTemplateEngine(extension: ext)
        router.add(templateEngine: engine)
    }

}
