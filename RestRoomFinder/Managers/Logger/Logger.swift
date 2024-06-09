//
//  Logger.swift
//  RestRoomFinder
//
//  Created by Takasur Home on 09/06/2024.
//

import Foundation

// Define the Logger protocol
protocol Logger {
    func log(_ message: String)
}

// Implement a ConsoleLogger that logs to the console in debug builds
struct ConsoleLogger: Logger {
    func log(_ message: String) {
        #if DEBUG
        print("[DEBUG]: \(message)")
        #endif
    }
}
