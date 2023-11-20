// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Color {
    internal static let _151522 = ColorAsset(name: "151522")
    internal static let backgroundF7F2EF = ColorAsset(name: "Background_F7F2EF")
    internal static let backgroundF8F5F3 = ColorAsset(name: "Background_F8F5F3")
    internal static let black = ColorAsset(name: "Black")
    internal static let black60 = ColorAsset(name: "Black_60")
    internal static let gray2D3338 = ColorAsset(name: "Gray_2D3338")
    internal static let gray505C65 = ColorAsset(name: "Gray_505C65")
    internal static let gray9DA4AA = ColorAsset(name: "Gray_9DA4AA")
    internal static let grayCDD1D4 = ColorAsset(name: "Gray_CDD1D4")
    internal static let grayEEF1F3 = ColorAsset(name: "Gray_EEF1F3")
    internal static let grayF4F5F6 = ColorAsset(name: "Gray_F4F5F6")
    internal static let grayF8F9F8 = ColorAsset(name: "Gray_F8F9F8")
    internal static let green0F4F51 = ColorAsset(name: "Green_0F4F51")
    internal static let green0F4F5110 = ColorAsset(name: "Green_0F4F51_10")
    internal static let green0F4F5140 = ColorAsset(name: "Green_0F4F51_40")
    internal static let green1A676A = ColorAsset(name: "Green_1A676A")
    internal static let green458E8F = ColorAsset(name: "Green_458E8F")
    internal static let green799069 = ColorAsset(name: "Green_799069")
    internal static let white = ColorAsset(name: "White")
    internal static let white20 = ColorAsset(name: "White_20")
  }
  internal enum Icon {
    internal static let icAdd = ImageAsset(name: "icAdd")
    internal static let icArrow = ImageAsset(name: "icArrow")
    internal static let icArrowBottom = ImageAsset(name: "icArrowBottom")
    internal static let icArrowDefault = ImageAsset(name: "icArrowDefault")
    internal static let icArrowUp = ImageAsset(name: "icArrowUp")
    internal static let icCamera = ImageAsset(name: "icCamera")
    internal static let icChatapp = ImageAsset(name: "icChatapp")
    internal static let icCheckOff = ImageAsset(name: "icCheckOff")
    internal static let icCheckOn = ImageAsset(name: "icCheckOn")
    internal static let icCheckboxOff = ImageAsset(name: "icCheckboxOff")
    internal static let icCheckboxOn = ImageAsset(name: "icCheckboxOn")
    internal static let icClear = ImageAsset(name: "icClear")
    internal static let icClose = ImageAsset(name: "icClose")
    internal static let icExample = ImageAsset(name: "icExample")
    internal static let icFloatingButton = ImageAsset(name: "icFloatingButton")
    internal static let icGrayClose = ImageAsset(name: "icGrayClose")
    internal static let icGreenCheck = ImageAsset(name: "icGreenCheck")
    internal static let icImage = ImageAsset(name: "icImage")
    internal static let icLayout = ImageAsset(name: "icLayout")
    internal static let icMain = ImageAsset(name: "icMain")
    internal static let icMapPin = ImageAsset(name: "icMapPin")
    internal static let icPresent = ImageAsset(name: "icPresent")
    internal static let icRadioOff = ImageAsset(name: "icRadioOff")
    internal static let icRadioOn = ImageAsset(name: "icRadioOn")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
