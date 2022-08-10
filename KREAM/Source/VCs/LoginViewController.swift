//
//  LoginViewController.swift
//  KREAM
//
//  Created by 선민재 on 2022/08/10.
//

import UIKit
import Then
import SnapKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        for fontFamily in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
                print(fontName)
            }
        }
        super.viewDidLoad()
        view.backgroundColor = .background
        addView()
        setLayout()
    }
    
    lazy var Logo = UILabel().then{
        $0.text = "KREAM"
        $0.textColor = .Main
        $0.font = UIFont(name: "LeferiPoint-BlackOblique", size: 40)
    }

    
    lazy var Logotext = UILabel().then{
        $0.text = "KICKS RULE EVERYTHING AROUND ME"
        $0.textColor = .Main
        $0.font = UIFont(name: "LeferiBaseType-Bold", size: 12)
    }
    
    private func addView() {
        [Logo,Logotext].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Logo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(180)
        }
        Logotext.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(Logo.snp.top).offset(50)
        }
    }

}
