//
//  ViewController.swift
//  EggTimer
//
//  Created by MB using Angela Yu's tutorial 07/11/2020.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var counter = 60.0
    var increment = 1.0
    var timer = Timer()
    var player: AVAudioPlayer?
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
            progressBar.progress = progressBar.progress + Float(increment)
        }
        else if counter == 0 {
            timer.invalidate()
            titleLabel.text = "Eggs are Ready"
            progressBar.progress = 1
            playSound()
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
                
    }
    let eggTimes =  ["Soft": 5*60, "Medium": 7*60, "Hard":12*60]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        titleLabel.text = sender.currentTitle!
        counter = Double(eggTimes[hardness]!)
        increment = Double(1.0/counter)
        progressBar.progress = 0
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    



    
    
    
    
    
}
