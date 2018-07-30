//
//  PrivateKeyView.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/7/30.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import UIKit

class PrivateKeyView: UIView {
    let leftColor = #colorLiteral(red: 0.07058823529, green: 0.1137254902, blue: 0.1647058824, alpha: 1)
    let rightColor = #colorLiteral(red: 0.1490196078, green: 0.2705882353, blue: 0.4039215686, alpha: 1)
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        return self.layer as! CAGradientLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }
    
    
    
    override func awakeFromNib() {
        layer.cornerRadius = 25
        layer.shadowColor = #colorLiteral(red: 0.3179988265, green: 0.3179988265, blue: 0.3179988265, alpha: 1)
        layer.shadowRadius = 25
        layer.shadowOpacity = 0.5
    }
}
