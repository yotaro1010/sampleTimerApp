//
//  ViewController.swift
//  TimerApp
//
//  Created by Yotaro Ito on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    var timerObj : Timer?
    var counter = 0

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func startTimer(_ sender: Any) {
        if timerObj == nil {
            timerObj = Timer.scheduledTimer(
                timeInterval: TimeInterval(1.0),
                target: self,
                selector: #selector(ViewController.timerActionRepeat),
                userInfo: nil,
                repeats: true)
        }
        
    }
    
    @objc func timerActionRepeat() {
        statusLabel.text = String(repeating: "Yes", count: counter)
        counter += 1
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        if timerObj != nil{
            timerObj?.invalidate()
            timerObj = nil
            statusLabel.text = "メーター"
            counter = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statusLabel.text = "メーター"
    }


}

