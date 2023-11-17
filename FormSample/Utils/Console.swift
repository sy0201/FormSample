//
//  Console.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/10.
//

import Foundation


typealias console = Console
class Console {
    private init() {}

    enum LogLevel: String {
        case debug = "[Debug]"
        case info = "🔵 [Info]"
        case warning = "[Warning]"
        case devicelog = "[Cupping]"
        case error = "😤 [Error]"
    }

    class func debug(_ message: Any..., function: String = #function, file: String = #file, line: Int = #line ) {
        #if DEBUG
        Console.write(loglevel: .debug, message: message, function: function, file: file, line: line)
        #endif
    }

    class func info(_ message: Any..., function: String = #function, file: String = #file, line: Int = #line ) {
        #if DEBUG
            Console.write(loglevel: .info, message: message, function: function, file: file, line: line)
        #endif
    }

    class func error(_ message: Any..., function: String = #function, file: String = #file, line: Int = #line ) {
        #if DEBUG
            Console.write(loglevel: .error, message: message, function: function, file: file, line: line)
        #endif
    }

    class func warning(_ message: Any..., function: String = #function, file: String = #file, line: Int = #line ) {
        #if DEBUG
            Console.write(loglevel: .warning, message: message, function: function, file: file, line: line)
        #endif
    }

    class fileprivate func write(loglevel: LogLevel, message: Any, function: String, file: String, line: Int) {
        #if DEBUG
        let fileName = Console.fileName(file: file)
        let queue = Thread.isMainThread ? "UI" : "BG"
        print("\(loglevel.rawValue) (\(queue)) : \(String(reflecting: message)) \(fileName).\(function):\(line)")
        #endif
    }

    class fileprivate func fileName(file: String) -> String {
        var fileName = file
        if let match = fileName.range(of: "[^/]*$", options: .regularExpression) {
            fileName = String(fileName[match])
        }

        return fileName
    }
}
