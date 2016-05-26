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
    var myDefaultsBG = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.countno=self.myDefaults.integerForKey("countno") //Assigns value of count no from previous run
        
        //Using if? prevents the app from crashing on first run
        if let decoded = myDefaultsBG.objectForKey("color") as? NSData {
            if let decodedColor = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as? UIColor {
                    self.Background.backgroundColor = decodedColor //Assigning BGColor
            }
        }
        
        //Assigning Initial Count Value
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
        
        //Gets Random Color and sets it as BGColor
        let randomcolor : UIColor = self.getRandomColor()
        self.Background.backgroundColor = randomcolor 
        
        //Encodes BGcolor into a format that we can save it in
        let encodedData : NSData = NSKeyedArchiver.archivedDataWithRootObject(randomcolor) 
        
        //Saves BGcolor
        self.myDefaultsBG.setObject(encodedData, forKey: "color") 
        
        //Saves Countno
        self.myDefaults.setInteger(countno, forKey: "countno") 
    }
    
//On Clicking the Reset Button
    @IBAction func OnResetClick(sender: AnyObject) {
        
        self.countno=0
        CounterLabel.text = "\(countno)"
        self.Background.backgroundColor=UIColor.blackColor()
        
        //Encodes BGcolor(black) in format that we can save it in
        let encodedData : NSData = NSKeyedArchiver.archivedDataWithRootObject(UIColor.blackColor()) 
        
        //Saves BGcolor(black)
        self.myDefaultsBG.setObject(encodedData, forKey: "color") 

        //Saves Countno
        self.myDefaults.setInteger(self.countno, forKey: "countno") 
        
    }


}

