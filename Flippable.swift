//
//  Flippable.swift
//  
//
//  Created by Fabio Ritrovato on 18/02/2015.
//  Copyright (c) 2015 orange in a day. All rights reserved.
//

import UIKit

prefix operator ⦅╯°□°⦆╯{}
postfix operator ⧸⦅°⎽°⧸⦆ {}

protocol Flippable {
    func flip() -> Self
}

prefix func ⦅╯°□°⦆╯<T: Flippable>(inout rhs: T) -> T {
    rhs = rhs.flip()
    return rhs
}

postfix func ⧸⦅°⎽°⧸⦆<T: Flippable>(inout lhs: T) -> T {
    let old = lhs
    lhs = lhs.flip()
    return old
}


extension String: Flippable {
    
    static let flipMap: [Character: Character] = [
        "w":"ʍ","?":"¿","{":"}","'":",","∴":"∵","A":"∀","&":"⅋","C":"Ↄ","r":"ɹ","c":"ɔ","R":"ᴚ","G":"⅁","e":"ǝ","E":"Ǝ",";":"؛","V":"ᴧ","j":"ɾ","!":"¡",".":"˙","B":"𐐒","K":"⋊","i":"ı","T":"⊥","3":"Ɛ","<":">","l":"ʃ","P":"Ԁ","(":")","D":"◖","n":"u","J":"ſ","v":"ʌ","M":"W","[":"]","b":"q","N":"ᴎ","6":"9","Y":"⅄","‿":"⁀","7":"Ɫ","y":"ʎ","h":"ɥ","\"":"„","U":"∩","L":"⅂","f":"ɟ","F":"Ⅎ","k":"ʞ","d":"p","t":"ʇ","⁅":"⁆","a":"ɐ","_":"‾","m":"ɯ","4":"ᔭ","g":"ƃ","Q":"Ό","┬":"┻"
    ]
    
    func flip() -> String {
        return String(reverse(map(self) {
            String.flipMap[$0] ?? {
                let inverted: Character = $0
                return filter(String.flipMap, {
                    $1 == inverted
                }).first?.0 ?? inverted
                }($0)
            }))
    }
    
}

extension UIView: Flippable {
    
    func flip() -> Self {
        transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        return self
    }
    
}

extension UIImage: Flippable {
    
    func flip() -> Self {
        UIGraphicsBeginImageContextWithOptions(size, true, scale)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, size.width, size.height)
        CGContextRotateCTM(context, CGFloat(M_PI))
        self.drawAtPoint(CGPoint(x: 0.0, y: 0.0))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return self.dynamicType(CGImage: newImage.CGImage)!
    }
    
}