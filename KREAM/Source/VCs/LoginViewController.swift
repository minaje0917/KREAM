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
    private let bounds = UIScreen.main.bounds

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
    override func viewDidLayoutSubviews() {
        emailTextField.borderStyle = .none
    }
    
    let emailText = UILabel().then{
        $0.text = "이메일 주소"
        $0.textColor = .Main
        $0.font = UIFont(name: "LeferiBaseType-Regular", size: 15)
    }
    let pwText = UILabel().then{
        $0.text = "비밀번호"
        $0.textColor = .Main
        $0.font = UIFont(name: "LeferiBaseType-Regular", size: 15)
    }
    
    let emailTextField = UITextField().then {
        $0.placeholder = "예) kream@kream.co.kr"
    }
    let pwTextField = UITextField().then {
        $0.placeholder = ""
    }
    
    
    let emailUnderLine = UIView().then {
        $0.backgroundColor = .Line
    }
    let pwUnderLine = UIView().then {
        $0.backgroundColor = .Line
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
    
    lazy var signUpButton = UIButton().then{
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "LeferiBaseType-Regular", size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .Line
        $0.layer.cornerRadius = 10
        
    }

    
    private func addView() {
        [Logo,Logotext,emailTextField,emailUnderLine,emailText
        ,pwUnderLine,pwText,pwTextField, signUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Logo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }
        Logotext.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(Logo.snp.top).offset(55)
        }
        emailTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
            $0.trailing.equalToSuperview().offset(-20)
        }
        emailUnderLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leading.trailing.equalTo(emailTextField)
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
        }
        emailText.snp.makeConstraints{
            $0.leading.equalTo(emailTextField.snp.leading).offset(0)
            $0.bottom.equalTo(emailTextField.snp.top).offset(-7)
        }
        pwTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(400)
            $0.trailing.equalToSuperview().offset(-20)
        }
        pwUnderLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leading.trailing.equalTo(pwTextField)
            $0.top.equalTo(pwTextField.snp.bottom).offset(10)
        }
        pwText.snp.makeConstraints{
            $0.leading.equalTo(pwTextField.snp.leading).offset(0)
            $0.bottom.equalTo(pwTextField.snp.top).offset(-7)
        }
        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwUnderLine.snp.bottom).offset(40)
            $0.size.equalTo(bounds.height * 0.07)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
}
