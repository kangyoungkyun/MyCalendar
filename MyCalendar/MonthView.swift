//
//  MonthView.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//
//델리게이트 처리 (달 uiview클릭 하면, calender 에서 반응하게 만들기 )
//달uiview에 프로토콜 구현, caldender 에서 달uiview 프로토콜 상속 + 해당 프로토콜 메소드 구현


import UIKit

//델리게이트 함수
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
        // - 을 해줘야 위에 배열에 있는 값을 정확히 가져올 수 있다. 4월이면 -1 후 3. 위의 배열에 3번째 방이 4월 값이 들어가 있다.
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        print("MonthView에서 currentYear, currentMonthIndex \(currentYear)  , \(currentMonthIndex)")
        setupViews()
    }
    
    
    //이전달 다음달
    @objc func btnLeftRightAction(sender: UIButton) {
        
        print("이전달 다음달 버튼이 눌렀습니다.")
        
        //오른쪽 버튼을 눌렀을때
        if sender == btnRight{
            currentMonthIndex += 1
            if currentMonthIndex > 11{
                currentMonthIndex = 0
                currentYear += 1
            }
            
        //왼쪽 버튼을 눌렀을 때
        }else{
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
            
            
        }
        
        lblName.text = "\(currentYear)년 \(monthsArr[currentMonthIndex])"
        //이거 해줘야 calendarView에서 반응 함!
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
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
