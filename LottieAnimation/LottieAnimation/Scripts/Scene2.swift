//
//  Scene2.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/2/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie


class Scene2: MyMonsterMethod {
    let triangles = LOTAnimationView(name: "scene2_triangles_v02.json")
    let floorlines = LOTAnimationView(name:"scene2_floorlines_v02.json")
    let floor  = LOTAnimationView(name:"scene2_floor_v02.json")
    
    
    
    var smallDudeOn = false
    var bigDudeOn = false

    var smallDude : LOTAnimationView?
    var bigDude : LOTAnimationView?
    
    let frame = CGRect(x: 0, y: 150, width: 500, height: 500)



    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        play(object: floor, frame: frame, xOffSet: 0, isLoop: false)
        playPartThenLoop(object: floorlines, frame: frame, stopPoint: 0.5, xoffset: 0)
        playPartThenLoop(object: triangles, frame: frame, stopPoint: 0.5, xoffset: 0)

        setSmallDude(on: smallDudeOn)
        setBigDude(on: bigDudeOn)

        addText(string: "Strong written and verbal communication skills")
}

    func setSmallDude(on: Bool){
        if smallDude != nil{
            smallDude?.removeFromSuperview()
            smallDude = nil
        }
        
        let animation = on ? "scene2_smalldudeawake_v02" : "scene2_smalldudequiet_v02"
        smallDude = LOTAnimationView(name:animation)
        
        smallDude?.frame = CGRect(x: 0, y: 150, width: 200, height: 200)
        smallDude?.center.x = self.view.center.x - 170
        
        smallDude?.contentMode = .scaleAspectFit
        self.view.addSubview(smallDude!)
        
        playSmallDude()
        
}
    
    func setBigDude(on: Bool){
        if bigDude != nil{
            bigDude?.removeFromSuperview()
            bigDude = nil
        }
        
        let animation = on ? "scene2_bigdudeawake_v02" : "scene2_bigdudequiet_v02"
        bigDude = LOTAnimationView(name:animation)
        bigDude?.frame = CGRect(x: 50, y: 260, width: 420, height: 420)
        bigDude?.center.x = self.view.center.x
        bigDude?.contentMode = .scaleAspectFit
        self.view.addSubview(bigDude!)
        
        playBigDude()
        
        
        
    }

    
    
    func playSmallDude(){
        
        smallDude?.loopAnimation = false
        smallDude?.play(fromProgress:0, toProgress: 0.5, withCompletion:nil)
        delay(time: 2) {
            self.smallDude?.removeFromSuperview()
            self.view.addSubview(self.smallDude!)
            self.smallDude?.play(fromProgress:0.5, toProgress: 1, withCompletion:nil)
            self.smallDude?.loopAnimation = true
            self.addSmallDudeToggleRecognizer()
        }
        
    }
    
    func playBigDude(){
        
        bigDude!.loopAnimation = false
        bigDude!.play(fromProgress:0, toProgress: 0.5, withCompletion:nil)
        
        delay(time: 2) {
            self.bigDude!.removeFromSuperview()
            self.view.addSubview(self.bigDude!)
            self.bigDude!.loopAnimation = true
            self.bigDude!.play(fromProgress:0.5, toProgress: 1, withCompletion:nil)
            self.addBigDudeToggleRecognizer()
            
        }
        
    }

    
    
    func addSmallDudeToggleRecognizer(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.smallDudeToggle(recognizer:)))
        //tapRecognizer.numberOfTapsRequired = 1
        smallDude?.addGestureRecognizer(tapRecognizer)
        
        
    }
    func addBigDudeToggleRecognizer(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.bigDudeToggle(recognizer:)))
        //tapRecognizer.numberOfTapsRequired = 1
        bigDude?.addGestureRecognizer(tapRecognizer)
    }


    
    @objc func smallDudeToggle(recognizer : UITapGestureRecognizer){
        smallDudeOn  = !smallDudeOn
        setSmallDude(on: smallDudeOn)
    }
    
    @objc func bigDudeToggle(recognizer:UITapGestureRecognizer){
        bigDudeOn  = !bigDudeOn
        setBigDude(on: bigDudeOn)
    }
    

}
