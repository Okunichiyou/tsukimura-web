import Foundation
import Hummingbird

func buildRouter() throws -> Router<AppRequestContext> {
  let router = Router(context: AppRequestContext.self)
  router.addMiddleware {
    LogRequestsMiddleware(.info)
    FileMiddleware("public")
  }

  router.get("/up") { _, _ in
    Response(status: .ok)
  }

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
