//
//  ViewController.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 10/26/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class ViewController: MyMonsterMethod{
    
    @IBOutlet weak var startButton: UIButton!
    
    let myTitle = LOTAnimationView(name: "title.json")
    let titleFrame = CGRect(x: 0, y: 150, width: 500, height: 500)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        startButton.backgroundColor = .clear
        startButton.layer.cornerRadius = 5
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.init(red: 0.392, green: 0.157, blue:0.569, alpha: 1).cgColor

        startButton.titleLabel?.textColor = UIColor.init(red: 0.392, green: 0.157, blue:0.569, alpha: 1)

        startButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        play(object: myTitle, frame: titleFrame, xOffSet: 0, isLoop: false)
        self.view.bringSubviewToFront(myTitle)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        
        super.didReceiveMemoryWarning()
    }
    
 
}

