//
//  ViewController.swift
//  Stop Watch
//
//  Created by Sneha gindi on 10/03/17.
//  Copyright © 2017 Sneha Gindi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var currentTime = 0
    
    @IBOutlet weak var timerDisplay: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startButtonTouchUpInside(_ sender: Any) {
        if timer != nil {
            startButton.setTitle("Start", for: .normal)
        timer?.invalidate()
        timer = nil
        } else {
            startButton.setTitle("Stop!", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
                self.currentTime += 1
                let minutesPortion = String(format: "%02d", self.currentTime / 60 )
                let secondsPortion = String(format: "%02d", self.currentTime % 60 )
                self.timerDisplay.text? = "\(minutesPortion): \(secondsPortion)"
            }
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        startButton.setTitle("Start", for: .normal)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            self.currentTime = 0
            let minutesPortion = String(format: "%02d", self.currentTime / 60 )
            let secondsPortion = String(format: "%02d", self.currentTime % 60 )
            self.timerDisplay.text? = "\(minutesPortion): \(secondsPortion)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

