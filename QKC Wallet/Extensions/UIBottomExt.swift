//
//  UIBottomExt.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/8/6.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

extension UIButton {
    func wiggl() {
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        wiggleAnim.duration = 0.01
        wiggleAnim.repeatCount = 10
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = CGPoint(x: self.center.x - 2, y: self.center.y)
        wiggleAnim.toValue = CGPoint(x: self.center.x + 2, y: self.center.y)
        
        layer.add(wiggleAnim, forKey: "position")
    }
}
