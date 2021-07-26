//
//  SittingInfo.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class AddPet: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var btnDog: UIButton!
    @IBOutlet weak var btnCat: UIButton!
    
    @IBOutlet weak var viewMicrochipNumber: UIView!
    @IBOutlet weak var viewDescribeBehaviour: UIView!
    @IBOutlet weak var viewMedicationBehaviour: UIView!
    @IBOutlet weak var viewMedicalIssues: UIView!
    
    @IBOutlet weak var constTopLeashReactive: NSLayoutConstraint!
    @IBOutlet weak var constTopFeedInstruction: NSLayoutConstraint!
    @IBOutlet weak var constTopMedicalIssues: NSLayoutConstraint!
    @IBOutlet weak var constTopVaccinationExpiry: NSLayoutConstraint!
    
    @IBOutlet weak var tfPetName: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfType: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfBreed: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    @IBOutlet weak var tfMicrochip: UITextField!
    @IBOutlet weak var tfLeashReactive: UITextField!
    @IBOutlet weak var tfGenderIssues: UITextField!
    @IBOutlet weak var tfAggressiveBehaviour: UITextField!
    @IBOutlet weak var tfSpayed: UITextField!
    @IBOutlet weak var tfMedication: UITextField!
    @IBOutlet weak var tfMedicalIssues: UITextField!
    
    @IBOutlet weak var imgPet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- UIButtons
    @IBAction func tapDogCat(_ sender: UIButton) {
        
    }
    
    @IBAction func tapCamera(_ sender: UIButton) {
        
    }
    
    @IBAction func tapSave(_ sender: Any) {
       
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
    }
}
