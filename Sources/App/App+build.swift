import Configuration
import Foundation
import Hummingbird
import Logging

// Request context used by application
typealias AppRequestContext = BasicRequestContext

///  Build application
/// - Parameter reader: configuration reader
func buildApplication(reader: ConfigReader) async throws -> some ApplicationProtocol {
    let logger = {
        var logger = Logger(label: "tsukimura-web")
        logger.logLevel = reader.string(forKey: "log.level", as: Logger.Level.self, default: .info)
        return logger
    }()
    let router = try buildRouter()
    let app = Application(
        router: router,
        configuration: ApplicationConfiguration(reader: reader.scoped(to: "http")),
        logger: logger
    )
    return app
}

/// Build router
func buildRouter() throws -> Router<AppRequestContext> {
    let router = Router(context: AppRequestContext.self)
    // Add middleware
    router.addMiddleware {
        // logging middleware
        LogRequestsMiddleware(.info)
        FileMiddleware("public")
    }
    // Add default endpoint
    router.get("/") { _, _ in
        var calender = Calendar.current
        calender.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        let today = Date()

        let baseAge = "15"

        let currentYear = calender.component(.year, from: today)
        let birthday = calender.date(from: DateComponents(year: currentYear, month: 6, day: 3))!
        let age = currentYear - 2010 - (today < birthday ? 1 : 0)

        var displayAge = baseAge
        if age > 15 {
            displayAge = baseAge + String(age)
        }

        return ProfilePage.render(age: displayAge)
    }
    return router
}
