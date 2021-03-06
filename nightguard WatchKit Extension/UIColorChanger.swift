//
//  UIColorChanger.swift
//  scoutwatch
//
//  Created by Dirk Hermanns on 02.01.16.
//  Copyright © 2016 private. All rights reserved.
//

import UIKit
#if !os(iOS)
import WatchKit
#endif

/*
 * Calculates the Colors for the different UI Elements
 * corresponding to current blood and time values.
 * E.g. paints the blood glucose value red if above 200.
 */
class UIColorChanger {
    
    // Changes the color to red if blood glucose is bad :-/
    static func getBgColor(_ bg : String) -> UIColor {
        
        guard let bgNumber : Int = Int(bg) else {
            return UIColor.white
        }
        if bgNumber > 200 {
            return UIColor.nightguardRed()
        } else if bgNumber > 180 {
            return UIColor.nightguardYellow()
        } else if bgNumber > 70 {
            return UIColor.nightguardGreen()
        } else if bgNumber > 55 {
            return UIColor.nightguardYellow()
        } else {
            return UIColor.nightguardRed()
        }
    }
    
    static func getDeltaLabelColor(_ bgdelta : NSNumber) -> UIColor {
        
        let absoluteDelta = abs(bgdelta.int32Value)
        if (absoluteDelta >= 10) {
            return UIColor.nightguardRed()
        } else if (absoluteDelta >= 5) {
            return UIColor.nightguardYellow()
        } else {
            return UIColor.white
        }
    }
    
    static func getTimeLabelColor(_ lastUpdate : NSNumber) -> UIColor {
        
        let lastUpdateAsNSDate : Date = Date(timeIntervalSince1970: lastUpdate.doubleValue / 1000)
        let timeInterval : Int = Int(Date().timeIntervalSince(lastUpdateAsNSDate))
        if (timeInterval > 15*60) {
            return UIColor.nightguardRed()
        } else if (timeInterval > 7*60) {
            return UIColor.nightguardYellow()
        } else {
            return UIColor.white
        }
    }
}
