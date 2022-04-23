//
//  main.swift
//  WLAN
//
//  Created by Alsey Coleman Miller on 7/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if os(Linux)
import Glibc
#elseif os(macOS)
import Darwin.C
#endif

import Foundation
import WLAN

#if os(macOS)
import DarwinWLAN
#elseif os(Linux)
import LinuxWLAN
#endif

@main
struct WLANTool {

    static func main() async throws {
        
        #if os(macOS)
        let wlanManager = DarwinWLANManager()
        #elseif os(Linux)
        let wlanManager = try LinuxWLANManager()
        #endif
        
        guard let interface = wlanManager.interface
            else { throw CommandError.noInterface }
    
        print("Interface: \(interface)")
    
        #if os(Linux)
        let wirelessExtensions = try LinuxWirelessExtensions()
        let version = try wirelessExtensions.version(for: interface)
        print("Wireless Extension Version: \(version)")
        let name = try wirelessExtensions.name(for: interface)
        print("Wireless Extension Name: \(name)")
        #endif
    
        let networks = try await wlanManager.scan(for: nil, with: interface)
    
        print("Networks:")
        networks.forEach { print("\($0.ssid) \($0.bssid?.description ?? "")") }
    }
}