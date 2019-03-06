//
//  Scene4.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/6/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene4: MyMonsterMethod {
    
    let envi = LOTAnimationView(name: "scene4_envi_v02.json")
    let yellowdude = LOTAnimationView(name:"scene4_yellowdude_v02.json")
    let cylinder = LOTAnimationView(name: "scene4_cylinder_v02.json")
    let lineelements = LOTAnimationView(name: "scene4_lineelements_v02.json")
    let circleman = LOTAnimationView(name: "scene4_circleman_v02.json")

    
    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
    let cylinderframe = CGRect(x:0,y:330, width:165, height:165)
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        playPartThenLoop(object: envi, frame: fullframe, stopPoint: 0.5, xoffset: 0)
        playPartThenLoop(object: yellowdude, frame: fullframe, stopPoint: 0, xoffset: 0)
        playPartThenLoop(object: lineelements, frame: fullframe, stopPoint: 0.5, xoffset: 0)
        playPartThenLoop(object: cylinder, frame: cylinderframe, stopPoint: 0.5, xoffset: -100)
        
        setPressGesture()

        addText(string: "Advanced knowledge of 2D/3D animationo")

    }
    
    func setPressGesture(){
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.pressAction(recognizer:)))
        pressGesture.minimumPressDuration = 1
        pressGesture.numberOfTouchesRequired = 1
        cylinder.addGestureRecognizer(pressGesture)
    }
    
    @objc func pressAction(recognizer: UILongPressGestureRecognizer){
        play(object: circleman, frame: fullframe, xOffSet: 0, isLoop: false)
        delay(time: 4) {
            self.circleman.removeFromSuperview()
        }
    }
    

}
