//
//  UIButton.swift
//  NovaCore
//

import UIKit

extension UIButton {
    
    public func templateImages() {
        templateImageForState(.normal)
        templateImageForState(.selected)
        templateImageForState(.highlighted)
        templateImageForState(.disabled)
    }
    
    public func templateImageForState(_ state: UIControlState) {
        setImage(image(for: state)?.withRenderingMode(.alwaysTemplate), for: state)
    }
    
    public func setBackgroundColor(_ color: UIColor, forState state: UIControlState) {
        setBackgroundImage(color.pixel(), for: state)
    }
    
}
