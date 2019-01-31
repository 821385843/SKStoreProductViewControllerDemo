//
//  ViewController.swift
//  SKStoreProductViewControllerDemo
//
//  Created by xiewei on 2019/1/26.
//  Copyright © 2019年 xiewei. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loadAppleStorePage()
    }
    
    func loadAppleStorePage() {
        let vc = SKStoreProductViewController()
        vc.delegate = self
        // Apple ID
        let dict = [SKStoreProductParameterITunesItemIdentifier: "XXXX"]
        
        vc.loadProduct(withParameters: dict) { (result, error) in
            if result {
                print("Apple Store 界面调出成功！")
            }
        }
        present(vc, animated: true, completion: nil)
    }
}

extension ViewController: SKStoreProductViewControllerDelegate {
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}

