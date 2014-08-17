//
//  ViewController.swift
//  animation
//
//  Created by lighter on 2014/8/18.
//  Copyright (c) 2014年 lighter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()

    let button = UIButton.buttonWithType(UIButtonType.System) as UIButton

    override func viewDidLoad() {
        super.viewDidLoad()

        // set container frame add to the screen
        self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
        self.view.addSubview(container)

        // set red square frame up
        // we want the blue square to have the same position as redSquare
        // so lets just reuse blueSquare.frame
        self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueSquare.frame = redSquare.frame

        // set background colors
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()

        self.container.addSubview(self.redSquare)

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

        // create a 'tuple' (a pair of more of objects assigned to a sing)
        var views = (frontView: self.redSquare, backView: self.blueSquare)

        if(self.redSquare.isDescendantOfView(self.view)) {
            views = (frontView:self.redSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView:self.blueSquare, backView: self.redSquare)
        }

        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp

        UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
            // remove the front object...
            views.frontView.removeFromSuperview()

            // ... and add the other object
            self.container.addSubview(views.backView)

            }, completion: { finished in
                // any code entered here will be applied
                // .once the animation has completed
        })
    }


}

