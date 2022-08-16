//
//  DownloadProcess.swift
//  Downloader
//
//  Created by Vineet Choudhary on 18/05/20.
//  Copyright © 2020 Developer Insider. All rights reserved.
//

import Foundation

class DownloadProcess {
    //MARK: - private properties
    private var process: Process?
    
    //MARK: - public properties
    let url: String!
    let fileName: String!
    var progress: DownloadProgress?
    
    //MARK: - computed properties
    var isRunning: Bool {
        return process?.isRunning ?? false
    }
    
    var executableURL: URL? {
        get {
            checkProcess()
            return process?.executableURL
        }
        set {
            process?.executableURL = newValue
        }
    }
    
    var arguments: [String]? {
        get {
            checkProcess()
            return process?.arguments
        }
        set {
            process?.arguments = newValue
        }
    }
    
    var standardOutput: Any? {
        get {
            checkProcess()
            return process?.standardOutput
        }
        set {
            process?.standardOutput = newValue
        }
    }
    
    var standardError: Any? {
        get {
            checkProcess()
            return process?.standardError
        }
        set {
            process?.standardError = newValue
        }
    }
    
    //MARK: - Init
    init(url: String, fileName: String) {
        self.url = url
        self.fileName = fileName
        self.process = Process()
    }
    
    private func checkProcess() {
        if process == nil {
            process = Process()
        }
    }
    
    //MARK: - function
    func terminate() {
        process?.terminate()
        process = nil
    }
    
    func run() {
        do {
            try process?.run()
        } catch let error {
            print("An error occured while trying to run task: \(error.localizedDescription)")
        }
    }
}
