/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE"
 * As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return.
 * ----------------------------------------------------------------------------
 */

import UIKit

class ForceJustifiedLabel:UILabel{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lineBreakMode = NSLineBreakMode.ByClipping
    }
    
    override func drawRect(rect: CGRect) {
        if(self.text != nil){
            let textSize = self.text!.sizeWithAttributes([NSFontAttributeName : self.font])
            let strikeWidth = textSize.width
            let totalWidth:CGFloat = self.frame.width
            let expandTotalAmount = totalWidth - strikeWidth
            let numSpaces = self.text!.characters.count-1
            let expandPerSpace = expandTotalAmount/CGFloat(numSpaces)
            expandText(expandPerSpace);
        }
        super.drawRect(rect);
    }
    
    func expandText(expandPerSpace:CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: expandPerSpace, range: NSMakeRange(0, self.text!.characters.count))
        self.attributedText = attributedString
    }
    
}
