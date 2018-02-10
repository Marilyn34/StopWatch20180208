//
//  ViewController.swift
//  StopWatch
//
//  Created by 伊藤 遥 on 2018/02/07.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var perfLabel: UILabel!
    
    var counter: Float = 0.0

    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                        target: self,
                                        selector: #selector(self.up),
                                        userInfo: nil,
                                        repeats: true)
        }
        perfLabel.text = ""
    }
    
    @IBAction func stop() {
        if timer.isValid {
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset() {
        counter = 0.0
        label.text = "0.00"
        perfLabel.text = ""
    }
    
    @objc func up() {
        counter += 0.01
        label.text = String(format: "%.2f", counter)
    }
    
    @objc func hantei() {
        if counter <= 10.2 && counter >= 9.8 {
            perfLabel.text = "PERFECT!"
        } else if counter <= 10.3 && counter >= 9.7 {
            perfLabel.text = "GREAT"
        } else if counter <= 10.5 && counter >= 9.5 {
            perfLabel.text = "GOOD"
        } else {
            perfLabel.text = "BAD"
        }
    }
}

