//
//  dateCVCell.swift
//  MyCalendar
//
//  Created by MacBookPro on 2018. 4. 11..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit

class dateCVCell: UICollectionViewCell {
    //컬랙션 뷰 셀 설정
    let lbl: UILabel = {
      let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.cyan
        layer.cornerRadius = 20
        layer.masksToBounds = true
        addSubview(lbl)
        setupViews()
        }
    
    //제약조건 설정
    func setupViews(){
        lbl.topAnchor.constraint(equalTo: topAnchor).isActive=true
        lbl.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        lbl.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        lbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
