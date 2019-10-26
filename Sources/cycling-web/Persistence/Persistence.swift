import Foundation
import LoggerAPI
import SwiftKueryORM
import SwiftKueryPostgreSQL

enum Persistence {

    static func setUp() {
        let host = ProcessInfo.processInfo.environment["DBHOST"] ?? "localhost"
        let port = 5432 as Int32

        let databaseName = "mustache"
        let username = ProcessInfo.processInfo.environment["DBUSER"] ?? "postgres"
        let password = ProcessInfo.processInfo.environment["DBPASSWORD"] ?? "nil"

        let poolOptions = ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50)
        let options = [
            .databaseName(databaseName),
            .userName(username),
            .password(password),
            ] as [ConnectionOptions]


        let pool = PostgreSQLConnection.createPool(host: host, port: port, options: options, poolOptions: poolOptions)

        Database.default = Database(pool)

        do {
            try Ride.createTableSync()
        } catch let error {
            if let requestError = error as? RequestError, requestError == .ormQueryError {
                Log.info("Table \(Ride.tableName) already exists")
            } else {
                Log.error("Database connection error: " + "\(error)")
            }
        }
    }

}
