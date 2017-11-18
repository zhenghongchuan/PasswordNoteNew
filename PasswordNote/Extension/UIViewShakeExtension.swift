//
//  UIViewShakeExtension.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/31.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: Shake一个UIView
    func shakeLeftRight() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: self.center.x - 5, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: self.center.x + 5, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}

