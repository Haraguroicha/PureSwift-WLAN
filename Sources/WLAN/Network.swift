//
//  Network.swift
//  WLAN
//
//  Created by Alsey Coleman Miller on 7/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Encapsulates an IEEE 802.11 network. 
 */
public struct WLANNetwork: Equatable, Hashable {

    private var id: UUID = UUID()
    
    /// The service set identifier (SSID) for the network, returned as data.
    ///
    /// The SSID is defined as 1-32 octets.
    public let ssid: SSID
    
    /// The basic service set identifier (BSSID) for the network. 
    public let bssid: BSSID

    /// The raw data of the network information data
    public let raw: Any
    
    public init(ssid: SSID,
                bssid: BSSID,
                raw: Any) {
        
        self.ssid = ssid
        self.bssid = bssid
        self.raw = raw
    }

    public static func ==(lhs: WLANNetwork, rhs: WLANNetwork) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
