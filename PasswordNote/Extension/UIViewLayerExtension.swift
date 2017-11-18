//
//  UIViewLayerExtension.swift
//  AppleWorth
//
//  Created by 郑鸿川 on 2017/6/18.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit

//对UIView的Layer扩展
extension UIView {
    // MARK: UIView的圆角
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
