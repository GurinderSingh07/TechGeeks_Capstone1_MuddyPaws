//
//  SittingInfo.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 28/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit

class SittingInfo: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    // MARK:- IBOutlets
    @IBOutlet weak var constLeadingImgShot: NSLayoutConstraint!
    @IBOutlet weak var constLeadingImgOvernight: NSLayoutConstraint!
    
    @IBOutlet weak var cvPets: UICollectionView!
    @IBOutlet weak var constCVPetsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblYesOne: UILabel!
    @IBOutlet weak var lblNoOne: UILabel!
    @IBOutlet weak var lblYesTwo: UILabel!
    @IBOutlet weak var lblNoTwo: UILabel!
    
    // MARK:- ClassVariables
    var isShotRight = true
    var isOvernightRight = true
    var arrPets = ["",""]
    var selectedPets: [IndexPath] = []
   
    // MARK:- ViewLifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
        lblYesOne.textColor = UIColor.lightGray
        lblNoOne.textColor = UIColor.red
        lblYesTwo.textColor = UIColor.lightGray
        lblNoTwo.textColor = UIColor.red
    }

    // MARK:- UIButtons
    @IBAction func tapShots(_ sender: Any){
        if isShotRight {
            isShotRight = false
            lblYesOne.textColor = UIColor.green
            lblNoOne.textColor = UIColor.lightGray
            SlideImgShotLeft()
        }
        else{
            isShotRight = true
            lblYesOne.textColor = UIColor.lightGray
            lblNoOne.textColor = UIColor.red
            SlideImgShotRight()
        }
    }
    
    @IBAction func tapOvernight(_ sender: Any){
        if isOvernightRight {
            isOvernightRight = false
            lblYesTwo.textColor = UIColor.green
            lblNoTwo.textColor = UIColor.lightGray
            SlideImgOvernightLeft()
        }
        else{
            isOvernightRight = true
            lblYesTwo.textColor = UIColor.lightGray
            lblNoTwo.textColor = UIColor.red
            SlideImgOvernightRight()
        }
    }
    
    @IBAction func tapNext(_ sender: Any){
        
        if selectedPets.count == 0{
            AppDelegate.sharedInstance().alertView(message: "Please Select Pet", controller: self)
        }
        else{
            let addNotes = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "AddNotes")
            self.navigationController?.pushViewController(addNotes, animated: true)
        }
    }
    
    @IBAction func tapAdd(_ sender: Any){
        
        let addPet = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "AddPet")
        self.navigationController?.pushViewController(addPet, animated: true)
    }
    
    @IBAction func tapBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:- CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SittingInfoCell", for: indexPath) as! SittingInfoCell
        constCVPetsHeight.constant = cvPets.contentSize.height
        if selectedPets.contains(indexPath) {
            cell.imgTickUntick.image = UIImage(named: "fill")
        }
        else{
            cell.imgTickUntick.image = UIImage(named: "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedPets.contains(indexPath) {
            let index = selectedPets.firstIndex(of: indexPath)
            selectedPets.remove(at: index!)
        }
        else{
            selectedPets.append(indexPath)
        }
        cvPets.reloadData()
    }
    
    // MARK:- Animations
    func SlideImgShotRight(){
        UIView.animate(withDuration: 0.4) {
            self.constLeadingImgShot.constant = 91
            self.view.layoutIfNeeded()
        }
    }
    
    func SlideImgShotLeft(){
        UIView.animate(withDuration: 0.4) {
            self.constLeadingImgShot.constant = -1
            self.view.layoutIfNeeded()
        }
    }
    
    func SlideImgOvernightRight(){
        UIView.animate(withDuration: 0.4) {
            self.constLeadingImgOvernight.constant = 91
            self.view.layoutIfNeeded()
        }
    }
    
    func SlideImgOvernightLeft(){
        UIView.animate(withDuration: 0.4) {
            self.constLeadingImgOvernight.constant = -1
            self.view.layoutIfNeeded()
        }
    }
}
