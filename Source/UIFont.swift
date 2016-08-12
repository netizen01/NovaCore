//
//  UIFont.swift
//  NovaCore
//

import UIKit

extension UIFont {
    
    public func monospace() -> UIFont {
        let features = [
            [
                UIFontFeatureTypeIdentifierKey: kNumberSpacingType,
                UIFontFeatureSelectorIdentifierKey: kMonospacedNumbersSelector
            ]
        ]
        let monoDescriptor = fontDescriptor().fontDescriptorByAddingAttributes(
            [UIFontDescriptorFeatureSettingsAttribute: features]
        )
        return UIFont(descriptor: monoDescriptor, size: pointSize)
    }
    
}
