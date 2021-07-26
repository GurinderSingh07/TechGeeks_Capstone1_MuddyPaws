//
//  Signup.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 27/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//


import UIKit

class Signup: UIViewController,UITextFieldDelegate {
    // MARK:- IBOutlets
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
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
    
    // MARK:- UIButton
    @IBAction func tapSignup(_ sender: Any) {
        
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- UITextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfUserName {
            tfEmail.becomeFirstResponder()
        }
        else if textField == tfEmail{
            tfPassword.becomeFirstResponder()
        }
        else{
            tfPassword.resignFirstResponder()
        }
        return true
    }
}
