//
//  NovaMath.swift
//  NovaCore
//

import Foundation

extension Array where Iterator.Element == Double {
    
    public func median() -> Double {
        let s = sorted { $0 < $1 }
        if s.count % 2 == 0 {
            let d = s[(s.count / 2) - 1]
            let u = s[s.count / 2]
            return (d + u) * 0.5
        }
        return s[s.count / 2]
    }
    
    public func mean() -> Double {
        return count == 0 ? 0 : reduce(0) { $0 + $1 } / Double(count)
    }
    
    public func standardDeviation() -> Double? {
        if count < 1 { return nil }
        let m = mean()
        let sumOfSquaredDifferences = reduce(0) { $0 + pow($1 - m, 2) }
        return sqrt(sumOfSquaredDifferences / Double(count))
    }
}
