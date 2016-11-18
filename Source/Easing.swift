//
//  Easing.swift
//  NovaCore
//

import Foundation

open class Easing {
    
    open class func sineInOut(time: Double, start: Double, delta: Double, duration: Double) -> Double {
        return -delta / 2 * (cos(M_PI * time / duration) - 1) + start
    }
    
}
