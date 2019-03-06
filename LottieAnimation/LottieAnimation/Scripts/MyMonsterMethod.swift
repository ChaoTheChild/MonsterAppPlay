//
//  MyMonsterMethod.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 11/7/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit
import Lottie

class MyMonsterMethod: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiping()

    }
    
    func play(object: LOTAnimationView, frame: CGRect,xOffSet: CGFloat ,isLoop: Bool){
        object.frame = frame
        object.center.x = self.view.center.x + xOffSet
        object.contentMode = .scaleAspectFit
        
        self.view.addSubview(object)
        object.loopAnimation = isLoop
        object.play()
    }
    
    
    
    func playPartThenLoop(object: LOTAnimationView, frame: CGRect,stopPoint: CGFloat, xoffset: Int){
        object.frame = frame
        object.center.x = self.view.center.x + CGFloat(xoffset)
        object.contentMode = .scaleAspectFit
        
        self.view.addSubview(object)
        object.loopAnimation = false
        object.play(fromProgress:0, toProgress: stopPoint , withCompletion:nil)
        delay(time: 2) {
            object.removeFromSuperview()
            self.view.addSubview(object)
            object.loopAnimation = true
            object.play(fromProgress:stopPoint, toProgress: 1, withCompletion:nil)
            
        }

    }
    
    
    
    
    
    func loopParts(object: LOTAnimationView,frame:CGRect, from: CGFloat, to: CGFloat,x: CGFloat, y:CGFloat){
        object.frame = frame
        object.center.x = x
        object.center.y = y
        object.contentMode = .scaleAspectFit
        
        self.view.addSubview(object)
        object.loopAnimation = true
        object.play(fromProgress:from, toProgress: to, withCompletion:nil)
    }
    
    
    func delay(time:Int, closure: @escaping() -> Void){
        let deadline = DispatchTime.now() + .seconds(time)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            closure()
        }
        
    }
    
    
    func addSwiping(){
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft(recognizer:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight(recognizer:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)


        
    }
    

    
    @objc func swipeLeft(recognizer: UISwipeGestureRecognizer){
        self.performSegue(withIdentifier: "next", sender: self)
    }
    
    
    @objc func swipeRight(recognizer: UISwipeGestureRecognizer){
        self.performSegue(withIdentifier: "last", sender: self)

        
    }
    
    
    func addText(string: String){
        let label = UILabel(frame: CGRect(x: 0, y: 580, width: 500, height: 250))
        
        label.font = UIFont(name: "CenturyGothic", size: 60)
        
        label.textColor = UIColor.init(red: 0.392, green: 0.157, blue:0.569, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.text = string
        
        self.view.addSubview(label)
        
    }
}
