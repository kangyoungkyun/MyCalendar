//
//  CalenderView.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit

class CalenderView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
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
        return 3
    }
    //셀 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? dateCVCell

        return cell!
    }
    
    //제약조건 설정
    func setupViews() {
        addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive=true
        myCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive=true
        myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }

}
