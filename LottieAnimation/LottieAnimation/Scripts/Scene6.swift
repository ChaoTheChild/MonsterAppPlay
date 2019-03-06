//
//  Scene6.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/11/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene6: MyMonsterMethod {
    
    let puzzleoutline = LOTAnimationView(name: "scene6_puzzleoutline_v02.json")
    let bluepuzzle = LOTAnimationView(name: "scene6_puzzle1_v02.json")
    let purplrpuzzle = LOTAnimationView(name: "scene6_puzzle2_v01.json")
    let yellowpuzzle = LOTAnimationView(name: "scene6_puzzle3_v01.json")
    let redpuzzle = LOTAnimationView(name: "scene6_puzzle4_v01.json")
    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
    let frame = CGRect(x: 500, y: 465, width: 200, height: 200)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        play(object: puzzleoutline, frame: fullframe, xOffSet: 0, isLoop: false)
        loopParts(object: bluepuzzle,frame: frame, from: 0, to: 0.5, x: 200, y: 150)
        loopParts(object: purplrpuzzle, frame: frame, from: 0, to: 0.5, x: 200, y: 350)
        loopParts(object: yellowpuzzle, frame: frame, from: 0, to: 0.5, x: 500, y: 150)
        loopParts(object: redpuzzle, frame: frame, from: 0, to: 0.5, x: 700, y: 350)
        addPanGestureRecognizer()
        
        addText(string: "Excellent problem-solving skills")

    }
    
    func addPanGestureRecognizer(){
        let bluePan = UIPanGestureRecognizer(target: self, action: #selector(self.bluePan(recognizer:)))
        let purplePan = UIPanGestureRecognizer(target: self, action: #selector(self.purplePan(recognizer:)))
        let yellowPan = UIPanGestureRecognizer(target: self, action: #selector(self.yellowPan(recognizer:)))
        let redPan = UIPanGestureRecognizer(target: self, action: #selector(self.redPan(recognizer:)))

        bluepuzzle.addGestureRecognizer(bluePan)
        purplrpuzzle.addGestureRecognizer(purplePan)
        yellowpuzzle.addGestureRecognizer(yellowPan)
        redpuzzle.addGestureRecognizer(redPan)
    }

    @objc func bluePan(recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translation(in: self.view)
        let puzzle = recognizer.view
        puzzle?.center = CGPoint(x:(puzzle?.center.x)! + translation.x, y:(puzzle?.center.y)! + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        let location = puzzle?.center
        //let locationround = CGVector(dx: round(location!.x), dy: round(location!.y))
        
        if abs(location!.x-496)<5 && abs(location!.y-465)<5{
            puzzle?.removeFromSuperview()
           
                self.bluepuzzle.setProgressWithFrame(0)
                self.bluepuzzle.removeGestureRecognizer(recognizer)
                self.loopParts(object: self.bluepuzzle, frame: self.frame, from: 0.5, to: 1, x: 496, y: 465)
 
    
            
        }
    
    }
    
    @objc func purplePan(recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translation(in: self.view)
        let puzzle = recognizer.view
        puzzle?.center = CGPoint(x:(puzzle?.center.x)! + translation.x, y:(puzzle?.center.y)! + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        let location = puzzle?.center
        
        if abs(location!.x-347)<5 && abs(location!.y-341)<5{
            puzzle?.removeFromSuperview()
            
            self.purplrpuzzle.setProgressWithFrame(0)
            self.purplrpuzzle.removeGestureRecognizer(recognizer)
            self.loopParts(object: self.purplrpuzzle, frame: self.frame, from: 0.5, to: 1, x: 347, y: 341)
            
            
            
        }
        
    }
    
    
    @objc func yellowPan(recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translation(in: self.view)
        let puzzle = recognizer.view
        puzzle?.center = CGPoint(x:(puzzle?.center.x)! + translation.x, y:(puzzle?.center.y)! + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        let location = puzzle?.center
        
        if abs(location!.x-358)<5 && abs(location!.y-470)<5{
            puzzle?.removeFromSuperview()
            
            self.yellowpuzzle.setProgressWithFrame(0)
            self.yellowpuzzle.removeGestureRecognizer(recognizer)
            self.loopParts(object: self.yellowpuzzle, frame: self.frame, from: 0.5, to: 1, x: 358, y: 470)
            
            
            
        }
        
    }
    
    @objc func redPan(recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translation(in: self.view)
        let puzzle = recognizer.view
        puzzle?.center = CGPoint(x:(puzzle?.center.x)! + translation.x, y:(puzzle?.center.y)! + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        let location = puzzle?.center
        
        if abs(location!.x-472)<5 && abs(location!.y-339)<5{
            puzzle?.removeFromSuperview()
            
            self.redpuzzle.setProgressWithFrame(0)
            self.redpuzzle.removeGestureRecognizer(recognizer)
            self.loopParts(object: self.redpuzzle, frame: self.frame, from: 0.5, to: 1, x: 472, y: 339)
            
            
            
        }
        
    }
    
    
    
    
  
}

