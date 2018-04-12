//
//  CalenderView.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//
//델리게이트 처리 (달 uiview클릭 하면, calender 에서 반응하게 만들기 )
//달uiview에 프로토콜 구현, caldender 에서 달uiview 프로토콜 상속 + 해당 프로토콜 메소드 구현


import UIKit

class CalenderView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MonthViewDelegate {
    //monthView에서 이전달 다음달 클릭했을 때 여기가 반응 한다. 델리게이트 ! 위임해줬기 때문에 !!
    func didChangeMonth(monthIndex: Int, year: Int) {
        print("CalenderView에서 반응")
        print("켈린더 뷰에서 받았습니다. \(monthIndex) , \(year)")
    }
    
   
    //날짜 day를 보여쥴 컬랙션 뷰 객체
    let myCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let myCollectoinView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        myCollectoinView.showsHorizontalScrollIndicator = false
        myCollectoinView.translatesAutoresizingMaskIntoConstraints = false
        myCollectoinView.backgroundColor = UIColor.darkGray
        myCollectoinView.allowsMultipleSelection = false
        
        return myCollectoinView
        }()
    
    //달을 보여줄 uiview 객체
    let monthView: MonthView = {
      let view = MonthView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //요일 보여줄 uiview 객체
    let weekdaysView: WeekdaysView = {
        let view = WeekdaysView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //진입점
    override init(frame: CGRect) {
        super.init(frame: frame)
        //초기화 함수
        initializeView()
        //레이아웃 지정 해주기
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //초기화
    func initializeView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(dateCVCell.self, forCellWithReuseIdentifier: "Cell")
    }
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    //셀 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? dateCVCell

        return cell!
    }
    
    //컬렉션뷰 셀 사이즈 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/7 - 8
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    //위아래 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    //가로 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    
    //제약조건 설정
    func setupViews() {
        addSubview(monthView)
        monthView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        monthView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        monthView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        monthView.heightAnchor.constraint(equalToConstant: 35).isActive=true
        monthView.delegate=self
        
        addSubview(weekdaysView)
        weekdaysView.topAnchor.constraint(equalTo: monthView.bottomAnchor).isActive=true
        weekdaysView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        weekdaysView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        weekdaysView.heightAnchor.constraint(equalToConstant: 30).isActive=true
        
        addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: weekdaysView.bottomAnchor, constant: 10).isActive=true
        myCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive=true
        myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }

}
