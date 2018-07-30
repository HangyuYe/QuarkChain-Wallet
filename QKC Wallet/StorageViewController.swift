//
//  StorageViewController.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/7/27.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet weak var privateKey1: UILabel!
    @IBOutlet weak var privateKey2: UILabel!
    @IBOutlet weak var privateKey3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstCopyPressed(_ sender: Any) {
        UIPasteboard.general.string = privateKey1.text
    }
    
    @IBAction func firstPastePressed(_ sender: Any) {
        privateKey1.text = UIPasteboard.general.string
    }
    
    @IBAction func secondCopyPressed(_ sender: Any) {
        UIPasteboard.general.string = privateKey2.text
    }
    
    @IBAction func secondPastePressed(_ sender: Any) {
        privateKey2.text = UIPasteboard.general.string
    }
    
    @IBAction func thirdCopyPressed(_ sender: Any) {
        UIPasteboard.general.string = privateKey3.text
    }
    
    @IBAction func thirdPastePressed(_ sender: Any) {
        privateKey3.text = UIPasteboard.general.string
        
    }
    
}
