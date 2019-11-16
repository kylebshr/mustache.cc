import Foundation
import Kitura
import Credentials
import CredentialsHTTP


public struct BasicAuth: TypeSafeHTTPBasic {

    public let id: String

    private static let adminUsername = ProcessInfo.processInfo.environment["ADMIN_USERNAME"] ?? "admin"
    private static let adminPassword = ProcessInfo.processInfo.environment["ADMIN_PASSWORD"] ?? "password"

    public static func verifyPassword(username: String, password: String, callback verify: @escaping (BasicAuth?) -> Void) {
        guard username == adminUsername && password == adminPassword else {
            return verify(nil)
        }

        verify(BasicAuth(id: username))
    }
}
