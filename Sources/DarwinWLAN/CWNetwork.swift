//
//  CWNetwork.swift
//  WLANDarwin
//
//  Created by Alsey Coleman Miller on 7/5/18.
//

#if canImport(CoreWLAN)

import Foundation
import CoreWLAN
import WLAN

internal extension WLANNetwork {
    
    init(_ coreWLAN: CWNetwork) {
        
        let ssid: SSID
        if let ssidData = coreWLAN.ssidData {
            ssid = SSID(data: ssidData)!
        } else {
            ssid = SSID(string: "<Hidden Network>")! // hidden SSID
        }
        
        let bssid: BSSID
        if let bssidString = coreWLAN.bssid {
            bssid = BSSID(rawValue: bssidString) ?? .zero
        } else {
            bssid = .zero // dont have permissions
        }
        
        self.init(ssid: ssid, bssid: bssid, raw: coreWLAN)
    }
}

#endif
