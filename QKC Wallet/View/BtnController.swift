//
//  BtnController.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/7/30.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import UIKit

class privateKeyCopyBtn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 25
        layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
    }
    
}

class privateKeyPasteBtn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 25
        layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
}

