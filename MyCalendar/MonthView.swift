//
//  MonthView.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit


protocol MonthViewDelegate:class {
    func didChangeMonth(monthIndex: Int, year: Int)
}

class MonthView: UIView {
    
    //년 , 월 타이틀
    let lblName : UILabel = {
      let lbl = UILabel()
        lbl.text = "0000년 00월"
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //이전달
    let btnLeft:UIButton = {
      let btn = UIButton()
        btn.setTitle("이전달", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.lightGray, for: .disabled)
        return btn
    }()
    
    //다음달
    let btnRight:UIButton = {
        let btn = UIButton()
        btn.setTitle("다음달", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.lightGray, for: .disabled)
        return btn
    }()
    
    //이전달 다음달
    @objc func btnLeftRightAction(sender: UIButton) {
        
        print("이전달 다음달 버튼이 눌렀습니다.")
        //이거 해줘야 calendarView에서 반응 함!
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    
    //달의 값을 가지고 있는 배열
    var monthsArr = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    //보여지는 월
    var currentMonthIndex = 0
    //보여지는 년
    var currentYear: Int = 0
    
    var delegate: MonthViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        setupViews()
    }
    
    
    func setupViews() {
        
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.constraint(equalTo: topAnchor).isActive=true
        btnLeft.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        btnLeft.widthAnchor.constraint(equalToConstant: 50).isActive=true
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
        
        self.addSubview(lblName)
        lblName.topAnchor.constraint(equalTo: topAnchor).isActive=true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        lblName.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        lblName.text="\(currentYear)년 \(monthsArr[currentMonthIndex])"
        
        self.addSubview(btnRight)
        btnRight.topAnchor.constraint(equalTo: topAnchor).isActive=true
        btnRight.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        btnRight.widthAnchor.constraint(equalToConstant: 50).isActive=true
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
      
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
