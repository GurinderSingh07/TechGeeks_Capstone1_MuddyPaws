//
//  LandingScreen.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 27/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class LandingScreen: UIViewController {
    
    // MARK:- IBOutlets
    
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
        
    }
    
    
    
    // MARK:- UIButtons
    @IBAction func tapFacebook(_ sender: Any) {
        
    }
    
    @IBAction func tapGoogle(_ sender: Any) {
        
    }
    
    @IBAction func tapServiceProvider(_ sender: UIButton) {
        
    }
    
    @IBAction func tapSignup(_ sender: Any) {
        
        let signUp = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "Signup")
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        
        let login = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "Login")
        self.navigationController?.pushViewController(login, animated: true)
    }
}
