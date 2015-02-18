// Playground - noun: a place where people can play

import UIKit
import XCPlayground

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

var table = "┬──┬"
⦅╯°□°⦆╯table
table⧸⦅°⎽°⧸⦆ // chill out bro
table

var container = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
container.backgroundColor = UIColor.whiteColor()
var guy = UILabel(frame: CGRectZero)
guy.text = " (╯°□°)╯"
guy.sizeToFit()
guy.frame = CGRectOffset(guy.bounds, 0, 80)
container.addSubview(guy)
var tableView = UIImageView(image: UIImage(named: "table"))
tableView.frame = CGRectOffset(tableView.bounds, 90, 33)
tableView.backgroundColor = UIColor.whiteColor()
container.addSubview(tableView)
XCPShowView("view", container)

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 100000), dispatch_get_main_queue()) { () -> Void in
    UIView.animateWithDuration(1,
        delay: 3.0,
        usingSpringWithDamping: 0.8,
        initialSpringVelocity: 3.0,
        options: UIViewAnimationOptions.allZeros,
        animations: { () -> Void in
            ⦅╯°□°⦆╯tableView
        }, completion: nil)
}

var swift = UIImage(named: "swift.jpg")!
XCPCaptureValue("Swift", swift)
⦅╯°□°⦆╯swift
XCPCaptureValue("Swift", swift)
