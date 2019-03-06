//
//  Scene7.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/17/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene7: MyMonsterMethod {

    let background = LOTAnimationView(name: "scene7_background_v01.json")
    let heartman = LOTAnimationView(name: "scene7_heartman_v01.json")
    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
    let heartmanframe = CGRect(x:0, y:150,width:350,height:350)
    var speed = 1.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        play(object: background, frame: fullframe, xOffSet: 0, isLoop: true)
        play(object: heartman, frame:heartmanframe, xOffSet:50 , isLoop: true)
        addspeedchange()
        
        addText(string: "Creative flair for visual storytelling")
    }
    
    func addspeedchange(){
        let taprecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changespeed(recognizer:)))
        heartman.addGestureRecognizer(taprecognizer)
    }
    
    
    @objc func changespeed(recognizer: UITapGestureRecognizer){
        if speed < 1 {
            speed += 0.1
        }else{
            if speed > 5{
                speed = 0.1
            }else{
                speed += 1.0
            }
        }
        
        heartman.animationSpeed = CGFloat(speed)
    }
    
    
    
    
}
