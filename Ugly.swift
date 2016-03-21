//
//  Ugly.swift
//  URLTester
//
//  Created by Korey Hinton on 3/20/16.
//  Copyright © 2016 Korey Hinton. All rights reserved.
//

import Foundation
import UIKit

func ugly(makeVisible makeVisible: Bool = false, makeOpaque: Bool = false) {
    
    let app = UIApplication.sharedApplication()
    
    guard let window = app.delegate?.window else {
        print("failed to run ugly function, there isn't even a window yet")
        return
    }
    
    guard let root = window?.rootViewController else {
        print("failed to run ugly function, there isn't even a root view controller yet")
        return
    }
    
    func randomColor() -> UIColor {
        let r: CGFloat = CGFloat(arc4random_uniform(60) % 170)
        let b: CGFloat = CGFloat(arc4random_uniform(60) % 170)
        let g: CGFloat = CGFloat(arc4random_uniform(60) % 170)
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    
    func traverseView(view: UIView) {
        view.backgroundColor = randomColor()
        
        if makeOpaque {
            view.alpha = 1.0
        }
        if makeVisible {
            view.hidden = false
        }
        
        for subview in view.subviews {
            traverseView(subview)
        }
    }
    
    func traverseController(controller: UIViewController) {
        
        traverseView(controller.view)
        
        for child in controller.childViewControllers {
            traverseController(child)
        }
        
        if let presented = controller.presentedViewController {
            traverseController(presented)
        }
    }
    traverseController(root)
}

