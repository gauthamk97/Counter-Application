//
//  ViewController.swift
//  Counter
//
//  Created by Gautham Kumar on 22/05/16.
//  Copyright © 2016 Gautham Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var CounterLabel: UILabel!

    var countno = 0
    var myDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.countno=self.myDefaults.integerForKey("countno")
        self.CounterLabel.text = "\(self.countno)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Generates a UIColor object of a random color
    func getRandomColor() -> UIColor {
        
        let Randomred:CGFloat = CGFloat(Float(arc4random_uniform(100))/100)
        let Randomblue:CGFloat = CGFloat(Float(arc4random_uniform(100))/100)
        let Randomgreen:CGFloat = CGFloat(Float(arc4random_uniform(100))/100)
        
        return (UIColor(red: Randomred,green: Randomgreen, blue: Randomblue,alpha: 1.0))
    }
 
//On Clicking the Count Button
    @IBAction func OnClick(sender: AnyObject) {
        countno+=1
        self.CounterLabel.text = "\(self.countno)"
        
        self.Background.backgroundColor = getRandomColor() //Changes BGColor
        
        self.myDefaults.setInteger(countno, forKey: "countno")
    }
    
//On Click the Reset Button
    @IBAction func OnResetClick(sender: AnyObject) {
        self.countno=0
        CounterLabel.text = "\(countno)"
        self.Background.backgroundColor=UIColor.blackColor()
        
        self.myDefaults.setInteger(self.countno, forKey: "countno")
    }


}

