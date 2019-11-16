import Foundation
import LoggerAPI
import SwiftKuery
import SwiftKueryORM
import SwiftKueryPostgreSQL

enum Persistence {

    static func setUp() {

        let pool: ConnectionPool
        let poolOptions = ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50)

        if let databaseURL = ProcessInfo.processInfo.environment["DATABASE_URL"], let url = URL(string: databaseURL) {
            pool = PostgreSQLConnection.createPool(url: url, poolOptions: poolOptions)
        } else {
            let host = "localhost"
            let port = 5432 as Int32

            let databaseName = "mustache"
            let username = "postgres"
            let password = "nil"

            let options = [
                .databaseName(databaseName),
                .userName(username),
                .password(password),
            ] as [ConnectionOptions]

            pool = PostgreSQLConnection.createPool(host: host, port: port, options: options, poolOptions: poolOptions)
        }

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
