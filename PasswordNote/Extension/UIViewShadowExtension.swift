//
//  UIViewShadowExtension.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/21.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: UIView的Shadow
    @IBInspectable
    var isShowShadow: Bool {
        get {
            return self.isShowShadow
        }
        set {
            if newValue {
                self.layer.shadowColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00).cgColor
                self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
                self.layer.shadowOpacity = 0.4
                self.layer.shadowRadius = 3
                
                let path = UIBezierPath()
                let width = self.bounds.size.width
                let height = self.bounds.size.height
                let x = self.bounds.origin.x
                let y = self.bounds.origin.y
                let addWH = CGFloat.init(10.0)
                
                let topLeft = CGPoint.init(x: self.bounds.origin.x - (addWH / 2), y: self.bounds.origin.y - (addWH / 2))
                let topMiddle = CGPoint.init(x: x + (width/2), y: y - addWH)
                let topRight = CGPoint.init(x: x + width + (addWH / 2) , y: y - (addWH / 2))
                
                let rightMiddle = CGPoint.init(x: x + width + addWH, y: y + (height/2))
                
                let bottomRight = CGPoint.init(x: x + width + (addWH / 2), y: y + height + (addWH / 2))
                let bottomMiddle = CGPoint.init(x: x+(width/2), y: y+height+addWH)
                let bottomLeft = CGPoint.init(x: x - (addWH / 2), y: y + height + (addWH / 2))
                
                let leftMiddle = CGPoint.init(x: x - addWH, y: y + (height / 2))
                
                path.move(to: topLeft)
                
                path.addQuadCurve(to: topRight, controlPoint: topMiddle)
                path.addQuadCurve(to: bottomRight, controlPoint: rightMiddle)
                path.addQuadCurve(to: bottomLeft, controlPoint: bottomMiddle)
                path.addQuadCurve(to: topLeft, controlPoint: leftMiddle)
                
                self.layer.shadowPath = path.cgPath
            }else {
                
            }
        }
    }
}
