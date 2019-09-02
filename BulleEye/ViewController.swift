//
//  ViewController.swift
//  BulleEye
//
//  Created by Abdullah Gebreil on 11/22/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
    
    
    
    var currnetvalue = 0
    var targetVlaue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scorelabel : UILabel!
    @IBOutlet weak var roundlabel :UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundvlue = slider.value.rounded()
        currnetvalue = Int(roundvlue)
        startNewRound()
        let thumImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumImageNormal, for: .normal)
        
        let thumImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumImageNormal, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackleftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackleftResizable = trackleftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackleftResizable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SmallButton")
        
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }


    @IBAction func showAlart() {
        let difference = abs(targetVlaue - currnetvalue)
        var points = 100 - difference
        score += points
        
        let title:String
        if difference == 0 {
            title = "Perfect"
            points += 100
        }
        else if difference < 5 {
            title = "you close from it "
            points += 50
        }
        else {
        title = " Not even closed "
        }
        let message = "The current Value: \(currnetvalue)"
        let alart = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alart.addAction(action)
        
        present(alart, animated: true, completion: nil)
        
    }
   
    @IBAction func showSlider(_ sender: UISlider)
    {
        let roundvlue = slider.value.rounded()
        currnetvalue = Int(roundvlue)
    
    }
    @IBAction func newGame () {
        startNewgame()
    }
    func startNewRound() {
        round += 1
        targetVlaue = Int.random(in: 1...100)
        currnetvalue = 50
        slider.value = Float(currnetvalue)
        updateLabels()
        
    }
    func updateLabels() {
        targetLabel.text = String(targetVlaue)
        scorelabel.text = String(score)
        roundlabel.text = String(round)
        
        
    }
    func startNewgame() {
        score = 0
        round = 0
        startNewRound()
    }
}

