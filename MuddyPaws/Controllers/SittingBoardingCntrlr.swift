//
//  SittingBoardingCntrlr.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 28/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import UIKit
import VACalendar

class SittingBoardingCntrlr: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK:- IBOutlets
    @IBOutlet weak var constViewPickPriceTop: NSLayoutConstraint!
    
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var lblPickUpTime: UILabel!
    @IBOutlet weak var lblDropOffTime: UILabel!
    @IBOutlet weak var lblPickPrice: UILabel!
    @IBOutlet weak var lblBarTitle: UILabel!
    @IBOutlet weak var lblStartDateTitle: UILabel!
    
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnBg: UIButton!
    @IBOutlet weak var btnDollar: UIButton!
    
    @IBOutlet weak var imgDollar: UIImageView!
    
    @IBOutlet weak var viewGotIt: UIView!
    
    @IBOutlet weak var viewSelectTime: UIView!
    @IBOutlet weak var tbSelectTime: UITableView!
    @IBOutlet weak var lblSelectTimeTitle: UILabel!
    
    // MARK:- ClassVariables
    var serviceType: String?
    var isFirstTime: Bool?
    var isStartDate: Bool?
    var isEndTime: Bool?
    
    // MARK:- Calendar
    var calendarView: VACalendarView!
    
    @IBOutlet weak var calendarViewSB: UIView!
    
    let defaultCalendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if calendarView.frame == .zero {
            calendarView.frame = CGRect(
                x: 0,
                y: 130,
                width: calendarViewSB.frame.width,
                height: calendarViewSB.frame.height - 130
            )
            calendarView.setup()
        }
    }
    
    @IBOutlet weak var monthHeaderView: VAMonthHeaderView!{
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLLL"
            
            let appereance = VAMonthHeaderViewAppearance(
                previousButtonImage: UIImage(named: "backs")!,
                nextButtonImage: UIImage(named: "Forward")!,
                dateFormatter: dateFormatter
            )
            monthHeaderView.delegate = self
            monthHeaderView.appearance = appereance
        }
    }
    
    @IBOutlet weak var weekDaysView: VAWeekDaysView!{
        didSet {
            let appereance = VAWeekDaysViewAppearance(symbolsType: .veryShort, calendar: defaultCalendar)
            weekDaysView.appearance = appereance
        }
    }
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstTime!{
            isFirstTime = false
            UIView.animate(withDuration: 0.1,delay: 0, animations: {
                self.btnBg.alpha = 0.6
            }, completion: { finished in
                UIView.animate(withDuration: 0.5, animations: {
                    self.viewGotIt.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                })
            })
        }
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- PrivateMethods
    func setInitials(){
        isFirstTime = true
        if  serviceType == "sitting" {
            lblBarTitle.text = "Schedule Sitting"
        }
        else{
            lblBarTitle.text = "Schedule Boarding"
        }
        
        btnDollar.isEnabled = false
        viewGotIt.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        // Calendar
        let calendar = VACalendar(calendar: defaultCalendar)
        calendarView = VACalendarView(frame: .zero, calendar: calendar)
        calendarView.showDaysOut = true
        calendarView.selectionStyle = .single
        calendarView.monthDelegate = monthHeaderView
        calendarView.dayViewAppearanceDelegate = self
        calendarView.monthViewAppearanceDelegate = self
        calendarView.calendarDelegate = self
        calendarView.scrollDirection = .horizontal
        calendarViewSB.addSubview(calendarView)
    }
    
    // MARK:- UIButtons
    @IBAction func tapDollar(_ sender: Any) {
        let sittingPrice = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "SittingPrice")
        self.navigationController?.pushViewController(sittingPrice, animated: true)
    }
    
    @IBAction func tapBg(_ sender: Any) {
        
    }
    
    @IBAction func tapStart(_ sender: Any) {
        isStartDate = true
        lblStartDateTitle.text = "Select Start Date"
        isEndTime = false
        showCalendar()
    }
    
    @IBAction func tapEnd(_ sender: Any) {
        isStartDate = false
        lblStartDateTitle.text = "Select End Date"
        lblSelectTimeTitle.text = "Select End Time"
        isEndTime = true
        showCalendar()
    }
    
    @IBAction func tapGotIt(_ sender: Any) {
        btnDollar.isEnabled = true
        UIView.animate(withDuration: 0.4,delay: 0, animations: {
            self.viewGotIt.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { finished in
            UIView.animate(withDuration: 1, animations: {
                self.viewGotIt.transform = CGAffineTransform(scaleX: 0, y: 0)
                self.btnBg.alpha = 0
                self.view.layoutIfNeeded()
            })
        })
    }
    
    @IBAction func tapYesNo(_ sender: UIButton) {
        if sender.tag == 0{
            if btnYes.backgroundColor == UIColor.green{
                btnYes.backgroundColor = UIColor.green
                btnNo.backgroundColor = UIColor.clear
                btnYes.setTitleColor(UIColor.white, for: .normal)
                btnNo.setTitleColor(UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1), for: .normal)
            }
            else{
                btnYes.backgroundColor = UIColor.green
                btnNo.backgroundColor = UIColor.clear
                btnNo.setTitleColor(UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1), for: .normal)
                btnYes.setTitleColor(UIColor.white, for: .normal)
            }
        }
        else{
            if btnNo.backgroundColor == UIColor.green{
                btnNo.backgroundColor = UIColor.green
                btnYes.backgroundColor = UIColor.clear
                btnYes.setTitleColor(UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1), for: .normal)
                btnNo.setTitleColor(UIColor.white, for: .normal)
            }
            else{
                btnNo.backgroundColor = UIColor.green
                btnYes.backgroundColor = UIColor.clear
                btnNo.setTitleColor(UIColor.white, for: .normal)
                btnYes.setTitleColor(UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1), for: .normal)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hidePickupview()
        }
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapNext(_ sender: Any) {
        let sittingInfo = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "SittingInfo")
        self.navigationController?.pushViewController(sittingInfo, animated: true)
    }
    
    @IBAction func tapStartDateClose(_ sender: UIButton) {
        hideCalendar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.showTimeView()
        }
    }
    
    @IBAction func tapSelectTimeConfirm(_ sender: Any) {
        if isEndTime!{
            hideTimeView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.showPickupView()
            }
        }
        else{
            hideTimeView()
        }
    }
    
    // MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTimeCell", for: indexPath) as! SelectTimeCell
        return cell
    }
    
    // MARK:- Animations
    func showPickupView(){
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [.curveEaseInOut], animations: {
            self.btnBg.alpha = 0.6
            self.constViewPickPriceTop.constant = UIScreen.main.bounds.size.height/2 - 240
            self.view.layoutIfNeeded()
        }, completion: { finished in
            
        })
    }
    
    func hidePickupview(){
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [.curveEaseInOut], animations: {
            self.constViewPickPriceTop.constant = UIScreen.main.bounds.size.height + 20
            self.view.layoutIfNeeded()
            self.btnBg.alpha = 0
        }, completion: { finished in
            self.constViewPickPriceTop.constant = -1000
        })
    }
    
    func showCalendar(){
        UIView.animate(withDuration: 0.3, animations: {
            self.calendarViewSB.alpha = 1
            self.btnBg.alpha = 0.6
            self.calendarViewSB.transform = CGAffineTransform(scaleX:0, y: 0)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, animations: {
                self.calendarViewSB.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        })
    }
    
    func hideCalendar(){
        UIView.animate(withDuration: 0.3, animations: {
            self.calendarViewSB.transform = CGAffineTransform(scaleX:1.1, y: 1.1)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, animations: {
                self.calendarViewSB.transform = CGAffineTransform(scaleX:0, y: 0)
                self.btnBg.alpha = 0
            })
        })
    }
    
    func showTimeView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewSelectTime.alpha = 1
            self.btnBg.alpha = 0.6
            self.calendarViewSB.transform = CGAffineTransform(scaleX:0, y: 0)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewSelectTime.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        })
    }
    
    func hideTimeView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewSelectTime.transform = CGAffineTransform(scaleX:1.1, y: 1.1)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewSelectTime.transform = CGAffineTransform(scaleX:0, y: 0)
                self.btnBg.alpha = 0
            })
        })
    }
}

