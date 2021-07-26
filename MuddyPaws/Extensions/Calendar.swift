//
//  Calendar.swift
//  Muddy Paws
//
//  Created by Gurinder Singh on 29/06/21.
//  Copyright © 2021 TechGeeks. All rights reserved.
//

import Foundation
import UIKit
import VACalendar

extension SittingBoardingCntrlr: VAMonthHeaderViewDelegate {
    
    func didTapNextMonth() {
        calendarView.nextMonth()
    }
    
    func didTapPreviousMonth() {
        calendarView.previousMonth()
    }
}

extension SittingBoardingCntrlr: VAMonthViewAppearanceDelegate {
    
    func leftInset() -> CGFloat {
        return 10.0
    }
    
    func rightInset() -> CGFloat {
        return 10.0
    }
    
    func verticalMonthTitleFont() -> UIFont {
        return UIFont(name:"Marker Felt",size:18)!
    }
    
    func verticalMonthTitleColor() -> UIColor {
        return .black
    }
    
    func verticalCurrentMonthTitleColor() -> UIColor {
        return .red
    }
}

extension SittingBoardingCntrlr: VADayViewAppearanceDelegate {
    
    func textColor(for state: VADayState) -> UIColor {
        switch state {
        case .out:
            return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
        case .selected:
            return .white
        case .unavailable:
            return .lightGray
        default:
            return .black
        }
    }
    
    func font(for state: VADayState) -> UIFont {
        return UIFont(name:"Marker Felt",size:18)!
    }
    
    func textBackgroundColor(for state: VADayState) -> UIColor {
        switch state {
        case .selected:
            return UIColor(red: 120/256, green: 88/256, blue: 207/256, alpha: 1)
        default:
            return .clear
        }
    }
    
    func shape() -> VADayShape {
        return .circle
    }
    
    func dotBottomVerticalOffset(for state: VADayState) -> CGFloat {
        switch state {
        case .selected:
            return 2
        default:
            return -7
        }
    }
}

extension SittingBoardingCntrlr: VACalendarViewDelegate {
    func selectedDate(_ date:Date) {
        
        if isStartDate!{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
            let myString = formatter.string(from: date)
            let yourDate = formatter.date(from: myString)
            formatter.dateFormat = "yyyy-MM-dd"
            let myStringafd = formatter.string(from: yourDate!)
            lblStartTime.text = myStringafd
        }
        else{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
            let myString = formatter.string(from: date)
            let yourDate = formatter.date(from: myString)
            formatter.dateFormat = "yyyy-MM-dd"
            let myStringafd = formatter.string(from: yourDate!)
            lblEndTime.text = myStringafd
        }
    }
}
