//
//  AddNotes.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class AddNotes: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var tfFood: UITextField!
    @IBOutlet weak var tfSleep: UITextField!
    @IBOutlet weak var tfWalk: UITextField!
    @IBOutlet weak var tfOther: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- UIButtons
    @IBAction func tapNext(_ sender: Any) {
        
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
