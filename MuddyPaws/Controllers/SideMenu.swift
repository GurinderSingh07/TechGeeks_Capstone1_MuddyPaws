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
        setupView()
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
        AppDelegate.sharedInstance().sideVC = self
        isMenuOpenedFirstTime = true
    }
    
    @objc func setupView(){
        scrollMenu.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        constImgUserTop.constant = UIScreen.main.bounds.size.height/2 - 75
        constLblUserNameTop.constant = UIScreen.main.bounds.size.height/2 + 150
        self.view.layoutIfNeeded()
        imgUser.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        imgUser.alpha = 0; imgHome.alpha = 0; imgCurrentRequest.alpha = 0; imgPricing.alpha = 0; imgPreviousRequest.alpha = 0;
        imgMyPets.alpha = 0; imgCustomerSupport.alpha = 0
        
        lblUserName.alpha = 0; lblHome.alpha = 0; lblCurrentRequest.alpha = 0; lblPricing.alpha = 0; lblPreviousRequest.alpha = 0; lblMyPets.alpha = 0; lblCustomerSupport.alpha = 0
    }
    
    // MARK:- UIButtons
    @IBAction func tapHome(_ sender: Any) {
        
        let home = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "UserHome")
               AppDelegate.sharedInstance().rootNC?.viewControllers = [home]
               animateDrawerClosing()
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
    
    // MARK:- Animations
    func animateDrawerOpening(){
        setupView()
        btnCloseDrawer.alpha = 1
        isAnimationDone = false
        lblUserName.text = "Kit Harrington"
        imgUser.alpha = 1
        
        UIView.animate(withDuration: 0.35, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.constContainerTrailing.constant = -(0.75 * UIScreen.main.bounds.size.width)
            self.view.layoutIfNeeded()
            self.viewContainer.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.btnCloseDrawer.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
        
        DispatchQueue.main.async {
            if self.isMenuOpenedFirstTime{
                self.isMenuOpenedFirstTime = false
                self.animateUserProfile()
            }
            else{
                self.animateUserProfileAndUserNameOtherTime()
            }
            self.perform(#selector(self.confirmCompletionOfAnimation), with: nil, afterDelay: 4.0)
        }
        constBtnCloserLeading.constant = 0
    }
    
    func animateDrawerClosing(){
        btnCloseDrawer.alpha = 0
        
        UIView.animate(withDuration: 0.35, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.constContainerTrailing.constant = 0
            self.view.layoutIfNeeded()
            self.viewContainer.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.btnCloseDrawer.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        if isAnimationDone == false {
            self.perform(#selector(self.setupView), with: nil, afterDelay: 0.3)
        }
        else{
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.lblUserName.alpha = 0; self.lblCurrentRequest.alpha = 0; self.lblPricing.alpha = 0;  self.lblPreviousRequest.alpha = 0; self.lblMyPets.alpha = 0; self.lblCustomerSupport.alpha = 0
            }, completion: {
                finished in self.setupView()
            })
        }
        constBtnCloserLeading.constant = 0
    }
    
    func animateUserProfile(){
        UIView.animate(withDuration: 0.3, delay: 0.2, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgUser.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }, completion:{
            finished in UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgUser.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.constImgUserTop.constant = 35
                    self.view.layoutIfNeeded()
                    
                }, completion: {
                    finished in
                    
                })
            })
            self.animateUserName()
        })
    }
    
    func animateUserName(){
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.lblUserName.alpha = 1
            self.constLblUserNameTop.constant = UIScreen.main.bounds.size.height/2 + 50
            self.view.layoutIfNeeded()
            
        }, completion:{
            finished in UIView.animate(withDuration: 0.5, delay: 0.2, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.constLblUserNameTop.constant = 130
                self.view.layoutIfNeeded()
                
            }, completion: {
                finished in self.animateMainOptions()
            })
        })
    }
    
    func animateUserProfileAndUserNameOtherTime(){
        self.constLblUserNameTop.constant = 130 ; self.constImgUserTop.constant = 35
        UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgUser.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgUser.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            }, completion: {
                finished in UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblUserName.alpha = 1
                    self.view.layoutIfNeeded()
                }, completion: {
                    finished in self.animateMainOptions()
                })
            })
        })
    }
    
    func animateMainOptions(){
        animateOption1()
        animateOption2()
        animateOption3()
        animateOption4()
        animateOption5()
        animateOption6()
    }
    
    func animateOption1(){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgHome.alpha = 1
            self.imgHome.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgHome.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblHome.alpha = 1
                }, completion: {
                    finished in
                    
                })
            })
        })
    }
    
    func animateOption2(){
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgCurrentRequest.alpha = 1
            self.imgCurrentRequest.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgCurrentRequest.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblCurrentRequest.alpha = 1
                }, completion: {
                    finished in
                    
                })
            })
        })
    }
    
    func animateOption3(){
        UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgPricing.alpha = 1
            self.imgPricing.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgPricing.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblPricing.alpha = 1
                }, completion: {
                    finished in
                    
                })
            })
        })
    }
    
    func animateOption4(){
        UIView.animate(withDuration: 0.2, delay: 0.4, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgPreviousRequest.alpha = 1
            self.imgPreviousRequest.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgPreviousRequest.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblPreviousRequest.alpha = 1
                }, completion: {
                    finished in
                    
                })
            })
        })
    }
    
    func animateOption5(){
        UIView.animate(withDuration: 0.2, delay: 0.6, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgMyPets.alpha = 1
            self.imgMyPets.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgMyPets.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblMyPets.alpha = 1
                }, completion: {
                    finished in
                    
                })
            })
        })
    }
    
    func animateOption6(){
        UIView.animate(withDuration: 0.2, delay: 0.8, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.imgCustomerSupport.alpha = 1
            self.imgCustomerSupport.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion:{
            finished in UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                self.imgCustomerSupport.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: {
                finished in UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
                    self.lblCustomerSupport.alpha = 1
                }, completion: {
                    finished in
                    
                })
            })
        })
    }
    
    @objc func confirmCompletionOfAnimation(){
        isAnimationDone = true
    }
}
