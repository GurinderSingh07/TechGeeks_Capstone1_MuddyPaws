//
//  CheckOut.swift
//  MuddyPaws
//
//  Created by Gurinder Singh on 26/07/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class CheckOut: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var lblRequest: UILabel!
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var lblServiceTitle: UILabel!
    @IBOutlet weak var lblServicePrice: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    @IBOutlet weak var btnBook: UIButton!
    
    @IBOutlet weak var viewTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- UIButtons
    @IBAction func tapBookSitting(_ sender: Any) {
       
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
