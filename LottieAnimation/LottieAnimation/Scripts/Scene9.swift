//
//  Scene9.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/20/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene9: MyMonsterMethod {
    let floor = LOTAnimationView(name: "scene9_floor_v01.json")
    let tree = LOTAnimationView(name: "scene9_tree_v01.json")
    let bug = LOTAnimationView(name: "scene9_bug_v01.json")
    var rock = LOTAnimationView(name: "scene9_rockfalll_v01.json")
    var index = 0

    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
    let rockframe = CGRect(x: 0, y: 70, width: 500, height: 500)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        play(object: floor, frame: fullframe, xOffSet: 0, isLoop: false)
        playPartThenLoop(object: tree, frame: fullframe, stopPoint: 0.5, xoffset: 0)
        playPartThenLoop(object: bug, frame: fullframe, stopPoint: 0.5, xoffset: 0)
        playRock()
        addGestureRecog()
        
        addText(string: "Self-motivated and works well under pressure")
    }
    
    
    func playRock(){
        
        switch index{
        case 0:
            rock = LOTAnimationView(name: "scene9_rockfall_v01.json")
            playPartThenLoop(object: rock, frame: rockframe, stopPoint: 0.5, xoffset: 30)
            addGestureRecog()

        case 1:

            rock = LOTAnimationView(name: "scene9_rock1_v01.json")
            play(object: rock, frame: rockframe, xOffSet: 30, isLoop: true)
            addGestureRecog()

        case 2:

            rock = LOTAnimationView(name: "scene9_rock3_v01.json")
            play(object: rock, frame: rockframe, xOffSet: 30, isLoop: true)
            addGestureRecog()


        case 3:
            rock = LOTAnimationView(name: "scene9_rock4_v01.json")
            play(object: rock, frame: rockframe, xOffSet: 30, isLoop: true)
            addGestureRecog()


        default:
            rock = LOTAnimationView(name: "scene9_rockfall_v01.json")
        }
        
    }
    
    func addGestureRecog(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(recognizer:)))
        rock.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func tapAction(recognizer: UITapGestureRecognizer){
        rock.removeFromSuperview()
        rock.setProgressWithFrame(0)
        if index < 3{
            index += 1
        } else{
            index = 0
        }
        playRock()
    }

}
