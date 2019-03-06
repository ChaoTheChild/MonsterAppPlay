//
//  Scene3.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/4/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene3: MyMonsterMethod {
    
     let bg = LOTAnimationView(name: "scene3_bg_v02.json")
     let buckets = LOTAnimationView(name:"scene3_buckets_v02.json")
     let horsebody = LOTAnimationView(name:"scene3_horsebody_v02.json")
    let horsehead = LOTAnimationView(name:"scene3_horsehead_v02.json")
    let horsepaint = LOTAnimationView(name: "scene3_horsepaint_v02.json")
    
     let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
     let bucketsframe = CGRect(x: 150, y: 366, width: 300, height: 300)
     let horsebodyframe = CGRect(x:0,y:240, width:340,height:340)
    let horsepaintframe = CGRect(x:0,y:240, width:340,height:340)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        play(object: bg, frame: fullframe,xOffSet: 0,isLoop: false)
        play(object: horsebody, frame: horsebodyframe, xOffSet: 0,isLoop: false)
        play(object: buckets, frame: bucketsframe, xOffSet:46,isLoop: false)
        
        
     
        playHorsePaint()
        playPartThenLoop(object: horsehead, frame: horsebodyframe, stopPoint: 0.25, xoffset: 50)
        setSwipeGesture()
        addText(string: "Excellent design and typography skills")

 
    }
    
    

    func setSwipeGesture(){
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(recognizer:)))
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeGesture)
        
    }
    
    @objc func swipeAction(recognizer:UISwipeGestureRecognizer){
        
        horsepaint.removeFromSuperview()
        horsehead.removeFromSuperview()
        view.addSubview(horsepaint)
        view.addSubview(horsehead)
        horsepaint.loopAnimation = false
        horsehead.loopAnimation = true
        horsepaint.play(fromProgress:0.25, toProgress: 1, withCompletion:nil)
        horsehead.play(fromProgress:0.5, toProgress: 1, withCompletion:nil)
        setSwipeGesture()
        
    
    }
    
  
    
    func playHorsePaint(){
        horsepaint.frame = horsepaintframe
        horsepaint.center.x = self.view.center.x
        horsepaint.contentMode = .scaleAspectFit
        
        self.view.addSubview(horsepaint)
        horsepaint.loopAnimation = false
        horsepaint.play(fromProgress:0, toProgress: 0.25, withCompletion:nil)
    }
    
    
  
}
