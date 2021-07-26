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
    
    // MARK:- ClassVariable
    var isHiddenKey = false
    var isKeyWithMen = false
    var isFamily = false
    
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
        
    }
    
    // MARK:- UIButtons
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapNext(_ sender: Any) {
        let checkOut = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "CheckOut")
        self.navigationController?.pushViewController(checkOut, animated: true)
    }
    
    @IBAction func tapToGetIn(_ sender: UIButton) {
        if sender.tag == 0{
            if isHiddenKey{
                isHiddenKey = false
                imgHiddenKey.image = UIImage(imageLiteralResourceName: "unselect-box")
            }
            else{
                isHiddenKey = true
                imgHiddenKey.image = UIImage(imageLiteralResourceName: "select-box")
            }
        }
        else if sender.tag == 1{
            if isKeyWithMen{
                isKeyWithMen = false
                imgDoorMen.image = UIImage(imageLiteralResourceName: "unselect-box")
            }
            else{
                isKeyWithMen = true
                imgDoorMen.image = UIImage(imageLiteralResourceName: "select-box")
            }
        }
        else{
            if isFamily{
                isFamily = false
                imgHome.image = UIImage(imageLiteralResourceName: "unselect-box")
            }
            else{
                isFamily = true
                imgHome.image = UIImage(imageLiteralResourceName: "select-box")
            }
        }
    }
}
