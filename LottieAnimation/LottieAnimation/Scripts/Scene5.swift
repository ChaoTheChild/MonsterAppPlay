//
//  Scene5.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/7/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene5: MyMonsterMethod {
    
    let ildlescene = LOTAnimationView(name: "scene5_firstscene_v02.json")
    let reaction = LOTAnimationView(name: "scene5_reaction_v02.json")
    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ildlescene.frame = fullframe
        ildlescene.center.x = self.view.center.x
        ildlescene.contentMode = .scaleAspectFit

        playTheScene()
        addText(string: "Detail-orientated and hight organized")
    }
    
    func playTheScene(){
        
        ildlescene.setProgressWithFrame(0)
        self.view.addSubview(ildlescene)
        ildlescene.loopAnimation = false
        ildlescene.play(fromProgress:0, toProgress: 0.5 , withCompletion:nil)
        delay(time: 2) {
         self.ildlescene.removeFromSuperview()
         self.view.addSubview(self.ildlescene)
         self.ildlescene.play(fromProgress:0.5, toProgress: 1, withCompletion:nil)
         self.ildlescene.loopAnimation = true
         self.addSwipeGesture()
         }
        
    }
    
    func addSwipeGesture(){
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeaction(recognizer:)))
        swipeRecognizer.direction = UISwipeGestureRecognizer.Direction.up
        
        ildlescene.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc func swipeaction(recognizer: UISwipeGestureRecognizer){
        ildlescene.removeFromSuperview()
        playReaction()
       
    }
    
    func playReaction(){
        play(object: reaction, frame: fullframe, xOffSet: 0, isLoop: false)
        delay(time: 2) {
            self.reaction.removeFromSuperview()
            self.playTheScene()
        }
    }

    
}
