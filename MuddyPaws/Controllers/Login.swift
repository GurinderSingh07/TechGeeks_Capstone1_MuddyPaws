//
//  Login.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 27/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class Login: UIViewController,UITextFieldDelegate {
    
    // MARK:- IBOutlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
        
    }
    
    // MARK:- UIButtons
    @IBAction func tapLogin(_ sender: Any) {
        
        let user = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")
        self.navigationController?.pushViewController(user, animated: true)
    }
    
    @IBAction func tapBackHome(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- UITextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmail {
            tfPassword.becomeFirstResponder()
        }
        else{
            tfPassword.resignFirstResponder()
        }
        return true
    }
}
