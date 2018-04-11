//
//  CalendarController.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit

class CalendarController: UIViewController {
    
    //켈린더 뷰 객체 : 이 객체 안에는 컬랙션 뷰가 들어가 있다.
    let calendarView : CalenderView = {
       let view = CalenderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //뷰가 메모리로 로드된 직후에 호출된다.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "달력"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .yellow
        
        //캘린더 뷰를 넣어주고
        view.addSubview(calendarView)
        //제약조건 설정
        calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calendarView.heightAnchor.constraint(equalToConstant: 365).isActive=true
    }
    
    //뷰의 bound가 변경되면 뷰는 하위 뷰의 레이아웃을 변경해야 하는데, 그 작업이 이루어지기 직전에 호출된다.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calendarView.myCollectionView.collectionViewLayout.invalidateLayout()
    }

    
}
