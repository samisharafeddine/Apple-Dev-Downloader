//
//  Configuration.swift
//  Downloader
//
//  Created by Vineet Choudhary on 17/05/20.
//  Copyright © 2020 Developer Insider. All rights reserved.
//

import Foundation

//MARK: - Download Sources
enum DownloadSource: String, CaseIterable {
    case operatingSystems, tools, video
    
    var url: String {
        get {
            switch self {
            case .operatingSystems:
                return "https://developer.apple.com/download/"
            case .video:
                return "https://developer.apple.com/videos/"
            case .tools:
                return "https://developer.apple.com/download/all"
            }
        }
    }
    
    var title: String {
        get {
            switch self {
            case .operatingSystems:
                return NSLocalizedString("OperatingSystems", comment: "")
            case .video:
                return NSLocalizedString("WWDCVideos", comment: "")
            case .tools:
                return NSLocalizedString("DeveloperTools", comment: "")
            }
        }
    }
}

//Supported download file extension
enum SupportedExtension: String {
    case xip, dmg, zip, pdf, pkg, mov, mp4, avi, ipsw
    case unsupported
}

//Important cookies name
enum CookieName: String {
    case downloadAuthToken = "ADCDownloadAuth"
}

//Other URLs
enum AppleDomains: String {
    case auth = "idmsa.apple.com"
}
