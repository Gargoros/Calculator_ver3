
import Foundation

//MARK: Extension to convert all Decimal to String

extension Double {
  func clean(places: Int) -> String {
    let formatted = String(format: "%.\(places)f", self)
    guard formatted.contains(".") else { return formatted }
    var s = formatted
    while s.last == "0" { s.removeLast() }
    if s.last == "." { s.removeLast() }
    return s
  }
}
