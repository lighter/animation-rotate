//
//  ViewController.swift
//  animation
//
//  Created by lighter on 2014/8/18.
//  Copyright (c) 2014年 lighter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton.buttonWithType(UIButtonType.System) as UIButton

    override func viewDidLoad() {
        super.viewDidLoad()

        // set button frame
        self.setButton()
        self.view.addSubview(self.button)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setButton() {
        let screenSize:CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let buttonWidth = CGFloat(100)
        let buttonHeight = CGFloat(25)
        let doubleTwo = CGFloat(2)

        let buttonX = (screenWidth / doubleTwo ) - (buttonWidth / doubleTwo)
        let buttonY = screenHeight - (buttonHeight * doubleTwo)

        self.button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        self.button.setTitle("Animation", forState: UIControlState.Normal)
        self.button.addTarget(self, action: "animationClick:", forControlEvents:.TouchUpInside)
    }

    func animationClick(sender:UIButton!) {
        print("click")

        let square = UIView()
        square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
        square.backgroundColor = UIColor.redColor()

        self.view.addSubview(square)

        let path = UIBezierPath()

        path.moveToPoint(CGPoint(x: 16, y: 239))
        path.addCurveToPoint(CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))

        let anim = CAKeyframeAnimation(keyPath: "position")

        anim.path = path.CGPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0

        square.layer.addAnimation(anim, forKey: "animate position along path")

    }


}

