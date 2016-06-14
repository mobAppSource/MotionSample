//
//  ViewController.swift
//  SwiftMotionSample
//
//  Created by Master on 6/13/16.
//  Copyright © 2016 Master. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField
import CoreMotion


class ViewController: UIViewController {

    
    @IBOutlet weak var accX: JVFloatLabeledTextField!
    @IBOutlet weak var accY: JVFloatLabeledTextField!
    @IBOutlet weak var accZ: JVFloatLabeledTextField!
    @IBOutlet weak var maxAccX: JVFloatLabeledTextField!
    @IBOutlet weak var maxAccY: JVFloatLabeledTextField!
    @IBOutlet weak var maxAccZ: JVFloatLabeledTextField!
    
    @IBOutlet weak var rotX: JVFloatLabeledTextField!
    @IBOutlet weak var rotY: JVFloatLabeledTextField!
    @IBOutlet weak var rotZ: JVFloatLabeledTextField!
    @IBOutlet weak var maxRotX: JVFloatLabeledTextField!
    @IBOutlet weak var maxRotY: JVFloatLabeledTextField!
    @IBOutlet weak var maxRotZ: JVFloatLabeledTextField!
    
    // Instance Variables
    var cuMaxAccX: Double = 0.0
    var cuMaxAccY: Double = 0.0
    var cuMaxAccZ: Double = 0.0
    
    var cuMaxRotX: Double = 0.0
    var cuMaxRotY: Double = 0.0
    var cuMaxRotZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    var manager = MotionKit()
    
    @IBAction func btn_reset_tapped() {
        self.cuMaxAccX = 0
        self.cuMaxAccY = 0
        self.cuMaxAccZ = 0
        
        self.cuMaxRotX = 0
        self.cuMaxRotY = 0
        self.cuMaxRotZ = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.btn_reset_tapped()

//        self.manager.getAccelerometerValues(1.0) { (x, y, z) in
//            print("X: \(x) Y: \(y) Z: \(z)")
//        }
        self.manager.getAccelerationFromDeviceMotion(1.0) { (x, y, z) in
            print("X: \(x) Y: \(y) Z: \(z)")
        }
        
        
//        motionManager.accelerometerUpdateInterval = 0.2
//        
//        self.motionManager.startAccelerometerUpdates()
//        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) {
//            (accelerometerData: CMAccelerometerData?, error: NSError?) -> Void in
//            
//            self.outputAccData(accelerometerData!.acceleration)
//            if (error != nil)
//            {
//                print("Error in Acceleration: \(error?.localizedDescription)")
//            }
//        }
//        motionManager.gyroUpdateInterval = 0.2
//        self.motionManager.startGyroUpdates()
//        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!) {
//            (gyroData: CMGyroData?, error: NSError?) -> Void in
//            self.outputRotData(gyroData!.rotationRate)
//            if error != nil{
//                print("Error in Rotation: \(error?.localizedDescription)")
//            }
//        }
//        
//        self.motionManager.deviceMotionUpdateInterval = 0.2
//        self.motionManager.startDeviceMotionUpdates()
//        self.motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!) {
//            (devMotion: CMDeviceMotion?, error: NSError?) -> Void in
//            
//        }
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func outputDeviceMotion(devMotion: CMDeviceMotion){
        
    }
    //Motion displaying
    func outputAccData(acceleration: CMAcceleration){
//        self.accX.text = "\(acceleration.x).2fg)"
        self.accX.text = String(format: "%.3f.2fg", acceleration.x)
        if fabs(acceleration.x) > fabs(cuMaxAccX){
            self.cuMaxAccX = acceleration.x
        }
        self.accY.text = String(format: "%.3f.2fg", acceleration.y)
        if fabs(acceleration.y) > fabs(cuMaxAccY){
            self.cuMaxAccY = acceleration.y
        }
        self.accZ.text = String(format: "%.3f.2fg", acceleration.z)
        if fabs(acceleration.z) > fabs(cuMaxAccZ){
            self.cuMaxAccZ = acceleration.z
        }
        self.maxAccX.text = String(format: "%.3f .2f", cuMaxAccX)
        self.maxAccY.text = String(format: "%.3f .2f", cuMaxAccY)
        self.maxAccZ.text = String(format: "%.3f .2f", cuMaxAccZ)
    }
    
    func outputRotData(rotation: CMRotationRate){
        self.rotX.text = String(format: "%.3f", self.radians(fromDegrees: rotation.x))
        if fabs(rotation.x) > fabs(cuMaxRotX){
            self.cuMaxAccX = rotation.x
        }
        self.rotY.text = String(format: "%.3f", self.radians(fromDegrees: rotation.y))
        if fabs(rotation.y) > fabs(cuMaxRotY){
            self.cuMaxRotY = rotation.y
        }
        self.rotZ.text = String(format: "%.3f", self.radians(fromDegrees: rotation.z))
        if fabs(rotation.z) > fabs(cuMaxRotZ){
            self.cuMaxRotZ = rotation.z
        }
        self.maxRotX.text = String(format: "%.3f", self.radians(fromDegrees: cuMaxRotX))
        self.maxRotY.text = String(format: "%.3f", self.radians(fromDegrees: cuMaxRotY))
        self.maxRotZ.text = String(format: "%.3f", self.radians(fromDegrees: cuMaxRotZ))
    }
    // radians to degrees
    func radians(fromDegrees degrees: Double) -> Double {
        return 180 * degrees / M_PI
    }
    
}

