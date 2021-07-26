//
//  UserHome.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 28/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class UserHome: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet weak var viewSchedule: UIView!
    @IBOutlet weak var btnBg: UIButton!
    
    @IBOutlet weak var viewWalkLength: UIView!
    @IBOutlet weak var viewHomeVisit: UIView!
    @IBOutlet weak var lblSchduleTitle: UILabel!
    
    @IBOutlet weak var constViewScheduleHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblWalkLowPrice: UILabel!
    @IBOutlet weak var lblWalkMediunPrice: UILabel!
    @IBOutlet weak var lblWalkHighPrice: UILabel!
    
    @IBOutlet weak var lblVisitLowPrice: UILabel!
    @IBOutlet weak var lblVisitHighPrice: UILabel!
    
    @IBOutlet weak var imgWalkPaw: UIImageView!
    @IBOutlet weak var imgWalkDog: UIImageView!
    @IBOutlet weak var imgWalkDogCrown: UIImageView!
    
    @IBOutlet weak var imgVisitDog: UIImageView!
    @IBOutlet weak var imgVisitDogCrown: UIImageView!
    
    // MARK:- ClassVariable
    var service: String?
    var walkPrice: String?
    var visitPrice: String?
    var isDogWalk = false
    var isOnDemand: Bool?
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
        AppDelegate.sharedInstance().home = self
    }
    
    // MARK:- UIButtons
    @IBAction func tapMenu(_ sender: Any){
        
    }
    
    @IBAction func tapServices(_ sender: UIButton) {
        
    }
    
    @IBAction func tapBg(_ sender: Any) {
        
    }
    
    @IBAction func tapWalkLength(_ sender: UIButton) {
        
    }
    
    @IBAction func tapHomeVisti(_ sender: UIButton) {
        
    }
    
    @IBAction func tapSchedule(_ sender: Any) {
        
    }
    
    @IBAction func tapASAP(_ sender: Any) {
        
    }
}
