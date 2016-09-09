//
//  UIImage.swift
//  NovaCore
//

import UIKit

extension UIImage {   
    
    public func convertToGrayScale() -> UIImage {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, 0, colorSpace, CGImageAlphaInfo.None.rawValue)!
        CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), self.CGImage!);
        let mask = CGBitmapContextCreateImage(context)!
        return UIImage(CGImage: CGImageCreateWithMask(convertToGrayScaleNoAlpha(), mask)!, scale: scale, orientation:imageOrientation)
    }
    
    public class func imageWithColor(color: UIColor, cornerRadius: CGFloat) -> UIImage {
        return color.resizableImage(cornerRadius)
    }
    
}

extension UIImage {
    
    private func convertToGrayScaleNoAlpha() -> CGImageRef {
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let context = CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, 0, colorSpace, CGImageAlphaInfo.None.rawValue)!
        CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), self.CGImage!)
        return CGBitmapContextCreateImage(context)!
    }
    
}


// Thanks fabb: https://gist.github.com/fabb/007d30ba0759de9be8a3
extension UIImage {
    
    // colorize image with given tint color
    // this is similar to Photoshop's "Color" layer blend mode
    // this is perfect for non-greyscale source images, and images that have both highlights and shadows that should be preserved
    // white will stay white and black will stay black as the lightness of the image is preserved
    public func tint(tintColor: UIColor) -> UIImage {
        
        return modifiedImage { context, rect in
            // draw black background - workaround to preserve color of partially transparent pixels
            CGContextSetBlendMode(context, .Normal)
            UIColor.blackColor().setFill()
            CGContextFillRect(context, rect)
            
            // draw original image
            CGContextSetBlendMode(context, .Normal)
            CGContextDrawImage(context, rect, self.CGImage!)
            
            // tint image (loosing alpha) - the luminosity of the original image is preserved
            CGContextSetBlendMode(context, .Color)
            tintColor.setFill()
            CGContextFillRect(context, rect)
            
            // mask by alpha values of original image
            CGContextSetBlendMode(context, .DestinationIn)
            CGContextDrawImage(context, rect, self.CGImage!)
        }
    }
    
    // fills the alpha channel of the source image with the given color
    // any color information except to the alpha channel will be ignored
    public func fillAlpha(fillColor: UIColor) -> UIImage {
        
        return modifiedImage { context, rect in
            // draw tint color
            CGContextSetBlendMode(context, .Normal)
            fillColor.setFill()
            CGContextFillRect(context, rect)
            
            // mask by alpha values of original image
            CGContextSetBlendMode(context, .DestinationIn)
            CGContextDrawImage(context, rect, self.CGImage!)
        }
    }
    
    private func modifiedImage(@noescape draw: (CGContext, CGRect) -> ()) -> UIImage {
        
        // using scale correctly preserves retina images
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context: CGContext! = UIGraphicsGetCurrentContext()
        assert(context != nil)
        
        // correctly rotate image
        CGContextTranslateCTM(context, 0, size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        
        let rect = CGRectMake(0.0, 0.0, size.width, size.height)
        
        draw(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}
