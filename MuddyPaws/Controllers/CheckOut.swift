//
//  CheckOut.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
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
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- PrivateMethods
    func setInitials()
    {
        if AppDelegate.sharedInstance().home?.service == "sitting"{
            lblRequest.text = "You are requesting a sitting for:"
            lblServiceTitle.text = "Sitting (1 Night)"
            btnBook.setTitle("Book Sitting", for: .normal)
        }
        else if AppDelegate.sharedInstance().home?.service == "boarding"{
            lblRequest.text = "You are requesting a boarding for:"
            lblServiceTitle.text = "Boarding (1 Night)"
            btnBook.setTitle("Book Boarding", for: .normal)
        }
        else if AppDelegate.sharedInstance().home?.service == "housevisit"{
            lblRequest.text = "You are requesting a home-visit for:"
            if (AppDelegate.sharedInstance().home?.isOnDemand)!{
                 lblServiceTitle.text = "Home-Visit"
                lblDays.text = "Today"
                viewTop.constant = 65
            }
            else{
                lblServiceTitle.text = "Home-Visit (1 Night)"
            }
            btnBook.setTitle("Book Home-Visit", for: .normal)
        }
        else{
            lblRequest.text = "You are requesting a dog-walk for:"
            if (AppDelegate.sharedInstance().home?.isOnDemand)!{
                lblServiceTitle.text = "Dog-Walk"
                
                lblDays.text = "Today"
                viewTop.constant = 70
            }
            else{
                lblServiceTitle.text = "Dog-Walk (1 Night)"
            }
            btnBook.setTitle("Book Dog-Walk", for: .normal)
        }
    }
    
    // MARK:- UIButtons
    @IBAction func tapBookSitting(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "selectedService")
        let alert = UIAlertController(title: title , message: "Booked Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { finished in
            AppDelegate.sharedInstance().home?.isOnDemand = false
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
