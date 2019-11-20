import Foundation
import HeliumLogger
import Kitura
import KituraCompression
import KituraOpenAPI
import KituraStencil
import Stencil

final class Application {

    private let router = Router()

    init(port: Int? = ProcessInfo.processInfo.environment["PORT"].flatMap(Int.init)) {

        HeliumLogger.use()

        router.all(middleware: Compression())

        configureStencil()
        configureAssets()
        configureCoders()

        Persistence.setUp()

        addRideRoutes(to: router)
        addAdminRoutes(to: router)

        KituraOpenAPI.addEndpoints(to: router)

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

    private func configureCoders() {
        router.encoders[.json] = {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            return encoder
        }

        router.decoders[.json] = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return decoder
        }
    }
}
