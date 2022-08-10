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
        
        super.viewDidLoad()
        view.backgroundColor = .background
        addView()
        setLayout()
    }
    
    lazy var Logo = UILabel().then{
        $0.text = "KREAM"
        $0.textColor = .Main
        $0.font = UIFont(name: "LeferiPoint-BlackOblique", size: 30)
    }

    
    private func addView() {
        [Logo].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Logo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

}
