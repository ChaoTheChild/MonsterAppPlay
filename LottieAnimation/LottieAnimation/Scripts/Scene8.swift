//
//  Scene8.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/18/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class Scene8: MyMonsterMethod {

    let back = LOTAnimationView(name: "scene8_back_v01.json")
    let table = LOTAnimationView(name: "scene8_table_v01.json")
    let action = LOTAnimationView(name: "scene8_action_v01.json")
    var piece = LOTAnimationView(name: "scene8_piece1_v01.json")
    var index = 0
    
    let fullframe = CGRect(x: 0, y: 150, width: 500, height: 500)
    let pieceframe = CGRect(x:0, y:200,width:500,height:500)

    override func viewDidLoad() {
        super.viewDidLoad()
        playPartThenLoop(object: back, frame: fullframe, stopPoint: 0.5, xoffset: 0)
        play(object: table, frame: fullframe, xOffSet: 0, isLoop: true)
        self.loopParts(object: action, frame: fullframe, from: 0, to: 0.5, x:self.view.center.x, y: 400)
        self.addSwipeGesture()
        self.playPiece()
    
        delay(time: 2) {
            self.view.bringSubviewToFront(self.action)
            self.view.bringSubviewToFront(self.piece)

        }
        
    }
    
    func playPiece(){
        
        switch index{
        case 0:
            piece = LOTAnimationView(name: "scene8_piece1_v01.json")
        case 1:
            piece = LOTAnimationView(name: "scene8_piece2_v01.json")
        case 2:
            piece = LOTAnimationView(name: "scene8_piece3_v01.json")
            
        default:
            piece = LOTAnimationView(name: "scene8_piece1_v01.json")
        }
        
        self.view.addSubview(piece)
        piece.frame = pieceframe
        piece.center.x = self.view.center.x
        piece.contentMode = .scaleAspectFit
        
        piece.loopAnimation = false
        piece.play(fromProgress:0, toProgress: 0.5, withCompletion:nil)
        
    }
    
    func addSwipeGesture(){
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(recognizer:)))
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeGesture)
        
        addText(string: "Strong understanding of post-production process")
    }
    
    
    @objc func swipeAction(recognizer: UISwipeGestureRecognizer){
        action.removeFromSuperview()
        piece.removeFromSuperview()
        self.action.setProgressWithFrame(0)
        self.piece.setProgressWithFrame(0)
        self.view.addSubview(action)
        self.view.addSubview(piece)
        action.loopAnimation = false
        piece.loopAnimation = false
        action.play(fromProgress:0.5, toProgress: 1, withCompletion:nil)
        piece.play(fromProgress:0.5, toProgress: 1, withCompletion:nil)
        
        delay(time: 2) {
            self.action.removeFromSuperview()
            self.piece.removeFromSuperview()
            self.action.setProgressWithFrame(0)
            self.piece.setProgressWithFrame(0)
            self.loopParts(object: self.action, frame: self.fullframe, from: 0, to: 0.5, x:self.view.center.x, y: 400)
            self.addSwipeGesture()
            
            if self.index < 2{
                self.index += 1
            } else{
                self.index = 0
            }
            self.playPiece()
            
        }
        
    
    }
}
