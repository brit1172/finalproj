//
//  timer1ViewController.swift
//  Finalproject
//
//  Created by Anna Waldbaum on 8/11/20.
//  Copyright © 2020 Anna Waldbaum. All rights reserved.
//

import UIKit
import AVFoundation

class timer1ViewController: UIViewController {

    var minutes = 25
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        minutes = Int(sender.value)
        lable.text = String(minutes) + " Minutes"
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timer1ViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    @objc func counter() {
        minutes -= 1
        lable.text = String(minutes) + " Minutes"
        
        if (minutes == 0){
            timer.invalidate()
            
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
            
            audioPlayer.play()
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        minutes = 25
        sliderOutlet.setValue(25, animated: true)
        lable.text = "25 Minutes"
        
        audioPlayer.stop()
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let audioPath = Bundle.main.path(forResource: "1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch{
            //ERROR
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
