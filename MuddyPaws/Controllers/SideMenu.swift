//
//  SideMenu.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 28/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//


import UIKit

class SideMenu: UIViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var scrollMenu: UIScrollView!
    
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnCloseDrawer: UIButton!
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblCurrentRequest: UILabel!
    @IBOutlet weak var lblPricing: UILabel!
    @IBOutlet weak var lblPreviousRequest: UILabel!
    @IBOutlet weak var lblMyPets: UILabel!
    @IBOutlet weak var lblCustomerSupport: UILabel!
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var imgCurrentRequest: UIImageView!
    @IBOutlet weak var imgPricing: UIImageView!
    @IBOutlet weak var imgPreviousRequest: UIImageView!
   
    @IBOutlet weak var imgMyPets: UIImageView!
    @IBOutlet weak var imgCustomerSupport: UIImageView!
    
    @IBOutlet weak var constImgUserTop: NSLayoutConstraint!
    @IBOutlet weak var constLblUserNameTop: NSLayoutConstraint!
    @IBOutlet weak var constContainerTrailing: NSLayoutConstraint!
    @IBOutlet weak var constBtnCloserLeading: NSLayoutConstraint!
    
    // MARK:- ClassVariables
    var isAnimationDone = false
    var isMenuOpenedFirstTime = false
    
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
        AppDelegate.sharedInstance().sideVC = self
        isMenuOpenedFirstTime = true
    }
    
    
    
    // MARK:- UIButtons
    @IBAction func tapHome(_ sender: Any) {
        
    }
    
    @IBAction func tapCurrentRequest(_ sender: Any) {
       
    }
    
    @IBAction func tapPricing(_ sender: Any) {
        
    }
        
    @IBAction func tapPreviousRequests(_ sender: Any) {
       
    }
    
    @IBAction func tapMyPets(_ sender: Any) {

    }
    
    @IBAction func tapCustomerSupport(_ sender: Any) {
        
    }
    
    @IBAction func tapCloseDrawer(_ sender: Any) {
        
    }
}
