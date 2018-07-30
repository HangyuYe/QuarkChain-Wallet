//
//  StorageViewController.swift
//  QKC Wallet
//
//  Created by Jerry on 2018/7/27.
//  Copyright © 2018年 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet weak var privateKey: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstCopyPressed(_ sender: Any) {
        UIPasteboard.general.string = privateKey.text
    }
    
    @IBAction func firstPastePressed(_ sender: Any) {
        privateKey.text = UIPasteboard.general.string
    }
    
}
