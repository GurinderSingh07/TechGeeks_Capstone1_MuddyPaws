//
//  SittingBoardingCntrlr.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 28/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class SittingBoardingCntrlr: UIViewController {
    
    // MARK:- IBOutlets
    
    
    // MARK:- ClassVariables
    var serviceType: String?
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
    
    }
    
    // MARK:- UIButtons
    @IBAction func tapBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
