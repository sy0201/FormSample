// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// 닫기
  internal static let close = L10n.tr("Localizable", "Close", fallback: "닫기")
  /// 신청서 작성 / 접수
  internal static let formMessage1 = L10n.tr("Localizable", "Form_message1", fallback: "신청서 작성 / 접수")
  /// 
  internal static let formMessage10 = L10n.tr("Localizable", "Form_message10", fallback: "")
  /// 신청서 작성
  internal static let formMessage2 = L10n.tr("Localizable", "Form_message2", fallback: "신청서 작성")
  /// 미접수내역
  internal static let formMessage3 = L10n.tr("Localizable", "Form_message3", fallback: "미접수내역")
  /// 사전점검 신청서 작성
  internal static let formMessage4 = L10n.tr("Localizable", "Form_message4", fallback: "사전점검 신청서 작성")
  /// 사전점검 시 발견한 하자 부분의 위치, 사진,  하자 부분의 내용을 작성하여 신청해주세요.
  internal static let formMessage5 = L10n.tr("Localizable", "Form_message5", fallback: "사전점검 시 발견한 하자 부분의 위치, 사진,  하자 부분의 내용을 작성하여 신청해주세요.")
  /// 미접수
  internal static let formMessage6 = L10n.tr("Localizable", "Form_message6", fallback: "미접수")
  /// 건
  internal static let formMessage7 = L10n.tr("Localizable", "Form_message7", fallback: "건")
  /// 작성된 신청서를 접수하셔야만 사전 확인 접수가 완료됩니다.
  internal static let formMessage8 = L10n.tr("Localizable", "Form_message8", fallback: "작성된 신청서를 접수하셔야만 사전 확인 접수가 완료됩니다.")
  /// 
  internal static let formMessage9 = L10n.tr("Localizable", "Form_message9", fallback: "")
  /// 환영합니다!입주에 한 발 다가가기 위한 사전확인 신청을 시작해봅시다!
  internal static let mainMessage1 = L10n.tr("Localizable", "Main_message1", fallback: "환영합니다!입주에 한 발 다가가기 위한 사전확인 신청을 시작해봅시다!")
  /// 다운로드 된 단지 정보가 없습니다.
  internal static let mainMessage2 = L10n.tr("Localizable", "Main_message2", fallback: "다운로드 된 단지 정보가 없습니다.")
  /// Localizable.strings
  ///   FormSample
  /// 
  ///   Created by siyeon park on 2023/11/17.
  internal static let preConfirmation = L10n.tr("Localizable", "Pre_confirmation", fallback: "사전확인")
  /// 사전확인신청
  internal static let requestPreConfirmation = L10n.tr("Localizable", "Request_Pre_confirmation", fallback: "사전확인신청")
  /// 단지선택
  internal static let selectApartmentComplex = L10n.tr("Localizable", "Select_Apartment_Complex", fallback: "단지선택")
  /// 작성하기
  internal static let writeForm = L10n.tr("Localizable", "WriteForm", fallback: "작성하기")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
