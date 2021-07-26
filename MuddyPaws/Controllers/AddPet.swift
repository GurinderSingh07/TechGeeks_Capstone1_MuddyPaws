//
//  SittingInfo.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit
import PhotosUI

class AddPet: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

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
    
    
    
    // MARK:- UIButtons
    @IBAction func tapDogCat(_ sender: UIButton) {
        
    }
    
    @IBAction func tapCamera(_ sender: UIButton) {
        
        showAlert()
    }
    
    @IBAction func tapSave(_ sender: Any) {
       
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
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