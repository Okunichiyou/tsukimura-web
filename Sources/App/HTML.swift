import Hummingbird
import NIOCore

struct HTML: ResponseGenerator {
  let html: String

  public func response(from request: Request, context: some RequestContext) throws -> Response {
    let buffer = ByteBuffer(string: self.html)

    return .init(
      status: .ok, headers: [.contentType: "text/html; charset=utf-8"],
      body: .init(byteBuffer: buffer))
  }
}
