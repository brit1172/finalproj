//
//  breakActivityContinuedViewController.swift
//  Finalproject
//
//  Created by Anna Waldbaum on 8/11/20.
//  Copyright © 2020 Anna Waldbaum. All rights reserved.
//

import UIKit
import AVFoundation

class breakActivityContinuedViewController: UIViewController {
    
   var audioPlayer:AVAudioPlayer!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "voice", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
        
        }catch let error as NSError {
            print(error.debugDescription)
        
                    }
        }

    @IBAction func play(_ sender: UIButton) {
       audioPlayer.play()
        }
    

    @IBAction func stop(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


