//
//  AddNotes.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class AddNotes: UIViewController,UITextFieldDelegate {
    
    // MARK:- IBOutlets
    @IBOutlet weak var tfFood: UITextField!
    @IBOutlet weak var tfSleep: UITextField!
    @IBOutlet weak var tfWalk: UITextField!
    @IBOutlet weak var tfOther: UITextField!
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    // MARK:- PrivateMethods
    func setInitials()
    {
        
    }
    
    // MARK:- UITextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfWalk{
            tfSleep.becomeFirstResponder()
        }
        else if textField == tfSleep{
            tfFood.becomeFirstResponder()
        }
        else if textField == tfFood{
            tfOther.becomeFirstResponder()
        }
        else{
            tfOther.resignFirstResponder()
        }
        return true
    }
    
    // MARK:- UIButtons
    @IBAction func tapNext(_ sender: Any) {
        let toGetIn = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "ToGetIn")
        self.navigationController?.pushViewController(toGetIn, animated: true)
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
