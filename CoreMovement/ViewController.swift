//
//  ViewController.swift
//  CoreMovement
//
//  Created by Suraj Sinha on 6/10/15.
//  Copyright (c) 2015 KingSoy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
        //Instance Variables
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    
        //Outlets
    @IBOutlet var accX: UILabel?
    @IBOutlet var accY: UILabel?
    @IBOutlet var accZ: UILabel?
    
    @IBOutlet var maxAccX: UILabel?
    @IBOutlet var maxAccY: UILabel?
    @IBOutlet var maxAccZ: UILabel?
    
    @IBOutlet var rotX: UILabel?
    @IBOutlet var rotY: UILabel?
    @IBOutlet var rotZ: UILabel?
    
    @IBOutlet var maxRotX: UILabel?
    @IBOutlet var maxRotY: UILabel?
    @IBOutlet var maxRotZ: UILabel?
    
        //Functions
    @IBAction func resetMaxValues() {
            currentMaxAccelX = 0;
            currentMaxAccelY = 0;
            currentMaxAccelZ = 0;
            
            currentMaxRotX = 0;
            currentMaxRotY = 0;
            currentMaxRotZ = 0;

    }
    
    
    
    
    

    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
    
        self.resetMaxValues()
        
        //Set Motion Manager Properties
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
        
        //Start Recording Data
        
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (accelerometerData: CMAccelerometerData!, error: NSError!) -> Void in
        self.outputAccelerationData(accelerometerData.acceleration)
            if(error != nil){
                println("\(error)")
            }
        
        })
        
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (gyroData: CMGyroData!, error: NSError!) -> Void in
            self.outputRotationalData(gyroData.rotationRate)
            if(error != nil){
                println("\(error)")
            }
        })
        
        
        
        super.viewDidLoad()
    }
    func outputAccelerationData(acceleration:CMAcceleration){
        accX?.text = "\(acceleration.x).2fg"
        if fabs(acceleration.x) > fabs(currentMaxAccelX)
        {
            currentMaxAccelX = acceleration.x
        }
        accY?.text = "\(acceleration.y).2fg"
        if fabs(acceleration.y) > fabs(currentMaxAccelY)
        {
            currentMaxAccelY = acceleration.y
        }
        accZ?.text = "\(acceleration.z).2fg"
        if fabs(acceleration.z) > fabs(currentMaxAccelZ)
        {
            currentMaxAccelZ = acceleration.z
        }
        
        maxAccX?.text = "\(currentMaxAccelX) .2f"
        maxAccY?.text = "\(currentMaxAccelY) .2f"
        maxAccZ?.text = "\(currentMaxAccelZ) .2f"


    }
    func outputRotationalData(rotation: CMRotationRate){
        
        rotX?.text = "\(rotation.x).2fg"
        if fabs(rotation.x) > fabs(currentMaxRotX)
        {
            currentMaxRotX = rotation.x
        }
        rotY?.text = "\(rotation.y).2fg"
        if fabs(rotation.y) > fabs(currentMaxRotY)
        {
            currentMaxRotY = rotation.y
        }
        rotZ?.text = "\(rotation.z).2fg"
        if fabs(rotation.z) > fabs(currentMaxRotZ)
        {
            currentMaxRotZ = rotation.z
        }
        
        maxAccX?.text = "\(currentMaxAccelX) .2f"
        maxAccY?.text = "\(currentMaxAccelY) .2f"
        maxAccZ?.text = "\(currentMaxAccelZ) .2f"
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

