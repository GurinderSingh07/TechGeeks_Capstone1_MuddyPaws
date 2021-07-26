//
//  ToGetIn.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class ToGetIn: UIViewController {

    // MARK:- IBOutlets
       @IBOutlet weak var imgHiddenKey: UIImageView!
       @IBOutlet weak var imgDoorMen: UIImageView!
       @IBOutlet weak var imgHome: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- UIButtons
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapNext(_ sender: Any) {
        
    }
    
    @IBAction func tapToGetIn(_ sender: UIButton) {
        
    }
}
