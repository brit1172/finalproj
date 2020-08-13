//
//  ViewController.swift
//  Finalproject
//
//  Created by Anna Waldbaum on 8/11/20.
//  Copyright © 2020 Anna Waldbaum. All rights reserved.
//

import UIKit
import AVFoundation
var musicEffect: AVAudioPlayer = AVAudioPlayer()
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let musicFile = Bundle.main.path(forResource: "soundfifteenmin", ofType: ".mp3")
        do{
            try musicEffect = AVAudioPlayer(contentsOf: URL (fileURLWithPath:musicFile!))
        }
        catch
        {
            print(error)
        }
        
    }


    
    
    @IBAction func noSound(_ sender: Any) {
        musicEffect.stop()
    }
    
    
    @IBAction func playSound(_ sender: Any) {
        musicEffect.play()
    }
}

