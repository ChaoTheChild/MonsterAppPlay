//
//  SecondViewController.swift
//  LottieAnimation
//
//  Created by FUChaoyue on 10/31/18.
//  Copyright © 2018 ChaoTheChild. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    
    let jobs = ["Motion Design","Motion Design","Motion Design"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jobs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jobs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "CenturyGothic", size: 25)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = jobs[row]
        pickerLabel?.textColor = UIColor.init(red: 0.392, green: 0.157, blue:0.569, alpha: 1)
        
        return pickerLabel!
    }

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        enterButton.backgroundColor = .clear
        enterButton.layer.cornerRadius = 5
        enterButton.layer.borderWidth = 1
        enterButton.layer.borderColor = UIColor.init(red: 0.392, green: 0.157, blue:0.569, alpha: 1).cgColor
        
        enterButton.titleLabel?.textColor = UIColor.init(red: 0.392, green: 0.157, blue:0.569, alpha: 1)
        
        enterButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

 



}
