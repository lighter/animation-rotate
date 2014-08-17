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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

