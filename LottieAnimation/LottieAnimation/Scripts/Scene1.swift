//
//  Scene1.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 10/31/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene1: MyMonsterMethod {

    
    let base = LOTAnimationView(name: "scene1_base_v02.json")
    let character = LOTAnimationView(name:"scene1_character_v02.json")
    let skylines = LOTAnimationView(name: "scene1_skylines_v02.json")
    let floorlines = LOTAnimationView(name: "scene1_floorlines_v02.json")
    let plants = LOTAnimationView(name: "scene1_plants_v02.json")
    let fire = LOTAnimationView(name: "scene1_fire_v02.json")
    let expression = LOTAnimationView(name:"scene1_expression_v02.json")
    
    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play(object: base, frame: fullframe, xOffSet: 0,isLoop: false)
        play(object: character, frame: fullframe, xOffSet: 0, isLoop: false)
        play(object: skylines, frame: fullframe,  xOffSet: 0,isLoop: true)
        play(object: floorlines, frame: fullframe, xOffSet: 0, isLoop: true)
        
        playPartThenLoop(object: plants, frame: fullframe, stopPoint: 0.25, xoffset: 0)
        playPartThenLoop(object: expression, frame: fullframe, stopPoint: 0, xoffset: 0)
        
        addText(string: "Passionate about motion design")
        
    }
    


    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motion == .motionShake){
            fire.frame = CGRect(x: 0, y: 142, width: 500, height: 500)
            fire.center.x = self.view.center.x
            fire.contentMode = .scaleAspectFill
            
            
            self.view.addSubview(fire)
            fire.loopAnimation = false
            fire.play(fromProgress:0, toProgress: 0.25, withCompletion:nil)
            delay(time: 2) {
                self.fire.removeFromSuperview()
                self.view.addSubview(self.fire)
                self.fire.loopAnimation = true
                self.fire.play(fromProgress:0.25, toProgress: 1, withCompletion:nil)
                
            }
            
            
        }else{
            return
        }
    }
    
  
    
  
    }

