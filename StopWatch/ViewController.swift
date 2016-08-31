//
//  ViewController.swift
//  StopWatch
//
//  Created by Yoorian YeEun Shin on 8/30/16.
//  Copyright © 2016 Yoorian Shin. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timer = NSTimer()
    var numFormatter = NSNumberFormatter()
    var time: Int = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var smallTimerLabel: UILabel!
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        numFormatter.minimumIntegerDigits = 2
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(TimerViewController.TimeTick), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        timer.invalidate()
    }
    
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerLabel.text = "00:00:00"
        smallTimerLabel.text = "00:00:00"
    }
    
    
    
    func TimeTick() {
        time += 1
        let min: Int = getMinutes(time)
        let sec: Int = getSeconds(time - (min * 600))
        let mil: Int = time - (min * 600) - (sec * 10)
        
        timerLabel.text = "\(numFormatter.stringFromNumber(min)!):\(numFormatter.stringFromNumber(sec)!):\(numFormatter.stringFromNumber(mil)!)"
        
        smallTimerLabel.text = "\(numFormatter.stringFromNumber(min)!):\(numFormatter.stringFromNumber(sec)!):\(numFormatter.stringFromNumber(mil)!)"
        
    }
    
    func getMinutes(mSec: Int) -> Int {
        if (mSec > 599) {
            return mSec / 600
        } else {
            return 0
        }
    }
    
    func getSeconds(mSec: Int) -> Int {
        if (mSec > 9 ) {
            return mSec / 10
        } else {
            return 0
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
