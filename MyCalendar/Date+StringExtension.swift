//
//  Date+StringExtension.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 12..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import Foundation
import UIKit
//달의 첫번째 날 얻기
extension Date{
    var weekday:Int{
        //print("Date weekday 변수 리턴 값: \(Calendar.current.component(.weekday, from: self))")
        //print("\n")
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth:Date{
        //print("Date firstDayOfTheMonth 변수 리턴 값: \(Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!)")
        // print("\n")
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}

//스트링 값으로 부터 날짜 얻기
extension String {
    static var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
       
        return formatter
    }()

    var date: Date? {
        // print("Date date 변수 리턴 값: \(String.dateFormatter.date(from: self))")
        // print("\n")
        return String.dateFormatter.date(from: self)
    }
}
