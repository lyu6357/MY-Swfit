//
//  ViewController.swift
//  EggTimer


import UIKit
import AVFoundation


class ViewController: UIViewController {
    // progressbar
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
  
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    @IBAction func hardnessSelected(_ sender: UIButton) {
      
        timer.invalidate()
        let hardness = sender.currentTitle!
    
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        //타이머 작동
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
      
    @objc func updateCounter() {
            if secondsPassed < totalTime {
                secondsPassed += 1
       
                //progressbard의progress 속도 조절 (Float을 먼저 사용해야 함.)
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                }
            
            else{
                // 타이머가 끝나면 타이틀 이름이 바뀜!!
                timer.invalidate()
                titleLabel.text = "Hey! IT's DONE!"
              
                // 사운드
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                                
                }
            }
        
        }

        
    
    
    
    
    
    
    

