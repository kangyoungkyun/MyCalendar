//
//  WeekdaysView.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit

class WeekdaysView: UIView {

     var daysArr = ["일", "월", "화", "수", "목", "금", "토"]
    
    //스택뷰 객체 제작
    let myStackView:UIStackView = {
      let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    //일, 월, 화, 표시할 요일 라벨
    let lbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    //커스터마이징
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        
        setupViews()
        inputWeak()
    }
    
    //스택뷰에 일월화수 요일 넣어주기
    func inputWeak(){
        
        for i in 0..<7{
            lbl.text = daysArr[i]
            lbl.textAlignment = .center
            lbl.textColor = .black
            //스택뷰에 넣어주기
            myStackView.addArrangedSubview(lbl)
        }
        
    }
    
    //일,월화~~ 제약조건 설정
    func setupViews() {
        addSubview(myStackView)
        myStackView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
