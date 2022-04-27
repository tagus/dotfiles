#!/usr/bin/env swift

// credit goes to https://github.com/bouk/dark-mode-notify/blob/main/dark-mode-notify.swift

import Cocoa

@discardableResult
func runTask(_ args: [String]) -> Int32 {
    let isDark = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
    var env = ProcessInfo.processInfo.environment
    env["DARKMODE"] = isDark ? "1" : "0"

    print("is dark: \(isDark)")
    
    let task = Process()
    task.environment = env
    task.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    task.arguments = args
    task.standardError = FileHandle.standardError
    task.standardOutput = FileHandle.standardOutput

    do {
        try task.run()
        task.waitUntilExit()
    } catch {
        print("task failed: \(error)")
    }

    return task.terminationStatus
}

let args = Array(CommandLine.arguments.suffix(from: 1))
runTask(args)

DistributedNotificationCenter.default.addObserver(
    forName: Notification.Name("AppleInterfaceThemeChangedNotification"),
    object: nil,
    queue: nil) { n in
    runTask(args)
}

NSApplication.shared.run()
