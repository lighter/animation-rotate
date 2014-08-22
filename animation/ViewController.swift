//
//  ViewController.swift
//  animation
//
//  Created by lighter on 2014/8/18.
//  Copyright (c) 2014年 lighter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fish = UIImageView()

    let button = UIButton.buttonWithType(UIButtonType.System) as UIButton

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fish.image = UIImage(named: "fish.jpeg")
        self.fish.frame = CGRect(x: 50, y: 50, width:50, height: 50)
        self.view.addSubview(self.fish)

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

        // angles in iOS are measured as radians PI is 180 degrees so PI × 2 is 360 degrees
        let fullRotation = CGFloat(M_PI * 2)

        let duration = 2.0
        let delay = 0.0
        //let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
        let options = UIViewKeyframeAnimationOptions.CalculationModePaced

        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0

            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.fish.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.fish.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.fish.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })

            }, completion: {finished in
            // any code entered here will be applied
            // once the animation has completed
    
            })

    }


}

