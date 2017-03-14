//
//  ViewController.swift
//  CoreMotionDemo
//
//  Created by 阮巧华 on 2017/3/13.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

import UIKit
import CoreMotion

let manager = CMMotionManager()

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isGyroAvailable {
            
            if !manager.isGyroActive {
                
                let queue = OperationQueue()
                manager.gyroUpdateInterval = 0.1
                manager.startGyroUpdates(to: queue, withHandler: { [weak self](gyroData, error) in
                    let x = 20 * Float((gyroData?.rotationRate.x)!)
                    let y = 20 * Float((gyroData?.rotationRate.y)!)
                    DispatchQueue.main.async {
                        let imageView:UIImageView = (self?.imageView)!
                        let frame = (imageView.frame.offsetBy(dx: CGFloat(x), dy: CGFloat(y)))
                        if frame.minX > 0 {
                            
                        } else if frame.maxX < (self?.view.frame.width)! {
                            
                        } else if frame.minY > 0 {
                            
                        } else if frame.maxY < (self?.view.frame.height)! {
                            
                        } else {
                            imageView.frame = frame
                        }
                    }
                })
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

