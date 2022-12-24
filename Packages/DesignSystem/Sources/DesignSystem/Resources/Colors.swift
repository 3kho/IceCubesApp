import SwiftUI

extension Color {
  public static var brand: Color {
    Color("brand", bundle: .module)
  }
  
  public static var primaryBackground: Color {
    Color("primaryBackground", bundle: .module)
  }
  
  public static var secondaryBackground: Color {
    Color("secondaryBackground", bundle: .module)
  }
  
  public static var label: Color {
    Color("label", bundle: .module)
  }
}

extension Color: RawRepresentable {
  public init?(rawValue: Int) {
    let red =   Double((rawValue & 0xFF0000) >> 16) / 0xFF
    let green = Double((rawValue & 0x00FF00) >> 8) / 0xFF
    let blue =  Double(rawValue & 0x0000FF) / 0xFF
    self = Color(red: red, green: green, blue: blue)
  }

  public var rawValue: Int {
    guard let coreImageColor = coreImageColor else {
      return 0
    }
    let red = Int(coreImageColor.red * 255 + 0.5)
    let green = Int(coreImageColor.green * 255 + 0.5)
    let blue = Int(coreImageColor.blue * 255 + 0.5)
    return (red << 16) | (green << 8) | blue
  }

  private var coreImageColor: CIColor? {
    return CIColor(color: .init(self))
  }
}
