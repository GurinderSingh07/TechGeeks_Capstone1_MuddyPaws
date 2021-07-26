//
//  RootNavigation.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 28/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class RootNavigation: UINavigationController {

    // MARK:- IBOutlets
    

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
        let home = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "UserHome")
        self.viewControllers = [home]
        AppDelegate.sharedInstance().rootNC = self
    }
}
