//
//  SittingInfo.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit
import PhotosUI

class AddPet: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate  {
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
    
    // MARK:- Class Variables
    var selectedTextField : UITextField?
    
    var petPicker: UIPickerView!
    
    var petPickerOptions = [String]()
    
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
        petPicker = UIPickerView()
        petPicker.dataSource = self
        petPicker.delegate = self
    }
    
    func tapPet(select:(UIButton,UIColor) , unselect:(UIButton,UIColor)){
        select.0.backgroundColor = select.1
        unselect.0.backgroundColor = unselect.1
    }
    
    func showAlert() {
        let alert = UIAlertController()
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    print("Okay")
                } else {
                    print("Not Okay")
                }
            })
        }
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        imgPet.image = image
        self.dismiss(animated: true, completion: nil)
    }

    // MARK:- TextField
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfGender {
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Male","Female"]
            tfGender.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfType{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Dog","Cat"]
            tfType.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfSize{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Small","Medium","Large"]
            tfSize.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfSpayed{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfSpayed.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfMicrochip{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfMicrochip.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfLeashReactive{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfLeashReactive.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfGenderIssues{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfGenderIssues.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfAggressiveBehaviour{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfAggressiveBehaviour.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfMedication{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfMedication.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        else if textField == tfMedicalIssues{
            selectedTextField = textField
            petPickerOptions.removeAll()
            petPickerOptions = ["Yes","No"]
            tfMedicalIssues.inputView = petPicker
            petPicker.reloadAllComponents()
        }
        return true
    }
    
    // MARK:- UIButtons
    @IBAction func tapDogCat(_ sender: UIButton) {
        if sender.tag == 0{
            if btnDog.backgroundColor == UIColor(red: 120/256, green: 88/256, blue: 207/256, alpha: 1){
                tapPet(select: (btnDog,UIColor(red: 120/256, green: 88/256, blue: 207/256, alpha: 1)), unselect: (btnCat,UIColor(red: 12/256, green: 194/256, blue: 140/256, alpha: 1)))
            }
            else{
                tapPet(select: (btnDog,UIColor(red: 120/256, green: 88/256, blue: 207/256, alpha: 1)), unselect: (btnCat,UIColor(red: 12/256, green: 194/256, blue: 140/256, alpha: 1)))
            }
        }
        else{
            if btnCat.backgroundColor == UIColor(red: 12/256, green: 194/256, blue: 140/256, alpha: 1){
                tapPet(select: (btnCat,UIColor(red: 120/256, green: 88/256, blue: 207/256, alpha: 1)), unselect: (btnDog,UIColor(red: 12/256, green: 194/256, blue: 140/256, alpha: 1)))
            }
            else{
                tapPet(select: (btnCat,UIColor(red: 120/256, green: 88/256, blue: 207/256, alpha: 1)), unselect: (btnDog,UIColor(red: 12/256, green: 194/256, blue: 140/256, alpha: 1)))
            }
        }
    }
    
    @IBAction func tapCamera(_ sender: UIButton) {
        showAlert()
    }
    
    @IBAction func tapSave(_ sender: Any) {
        let alert = UIAlertController(title: title , message: "Pet Added Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { finished in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return petPickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return petPickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedTextField?.text = petPickerOptions[row]
        if selectedTextField == tfMicrochip {
            if row == 0{
                showMicrochipNumberField()
            }
            else{
                hideMicrochipNumberField()
            }
        }
        if selectedTextField == tfAggressiveBehaviour {
            if row == 0{
                showAggressiveBehaviourField()
            }
            else{
                hideAggressiveBehaviourField()
            }
        }
        if selectedTextField == tfMedication {
            if row == 0{
                showMedicatinField()
            }
            else{
                hideMedicatinField()
            }
        }
        if selectedTextField == tfMedicalIssues {
            if row == 0{
                showMedicalIssuesField()
            }
            else{
                hideMedicalIssuesField()
            }
        }
    }
    
    //MARK:- Animations
    func showMicrochipNumberField(){
        UIView.animate(withDuration: 0.5, animations: {
            self.constTopLeashReactive.constant = 85
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.viewMicrochipNumber.alpha = 1
        })
    }
    
    func hideMicrochipNumberField(){
        UIView.animate(withDuration: 0.3, animations: {
             self.viewMicrochipNumber.alpha = 0
        }, completion: {finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.constTopLeashReactive.constant = 20
                self.view.layoutIfNeeded()
            })
        })
    }
    
    func showAggressiveBehaviourField(){
        UIView.animate(withDuration: 0.5, animations: {
            self.constTopFeedInstruction.constant = 190
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.viewDescribeBehaviour.alpha = 1
        })
    }
    
    func hideAggressiveBehaviourField(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewDescribeBehaviour.alpha = 0
        }, completion: {finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.constTopFeedInstruction.constant = 20
                self.view.layoutIfNeeded()
            })
        })
    }
    
    func showMedicatinField(){
        UIView.animate(withDuration: 0.5, animations: {
            self.constTopMedicalIssues.constant = 190
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.viewMedicationBehaviour.alpha = 1
        })
    }
    
    func hideMedicatinField(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewMedicationBehaviour.alpha = 0
        }, completion: {finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.constTopMedicalIssues.constant = 20
                self.view.layoutIfNeeded()
            })
        })
    }
    
    func showMedicalIssuesField(){
        UIView.animate(withDuration: 0.5, animations: {
            self.constTopVaccinationExpiry.constant = 190
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.viewMedicalIssues.alpha = 1
        })
    }
    
    func hideMedicalIssuesField(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewMedicalIssues.alpha = 0
        }, completion: {finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.constTopVaccinationExpiry.constant = 20
                self.view.layoutIfNeeded()
            })
        })
    }
}
