//
//  LoginViewController.swift
//  KREAM
//
//  Created by 선민재 on 2022/08/10.
//

import UIKit
import Then
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    private let bounds = UIScreen.main.bounds
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
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
    
    @objc func textFieldDidChange() {
        if isFilled(emailTextField) && isFilled(pwTextField){
            signUpButton.backgroundColor = .Main
        }
    }
    
    func isFilled(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        return true
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
    
    lazy var emailTextField = UITextField().then {
        $0.placeholder = "예) kream@kream.co.kr"
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    lazy var pwTextField = UITextField().then {
        $0.placeholder = ""
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    lazy var signInButton = UIButton().then{
        $0.backgroundColor = .background
        let text = NSAttributedString(string: "이메일 가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "LeferiBaseType-Regular", size: 13)
        $0.setTitleColor(.Main, for: .normal)
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
        ,pwUnderLine,pwText,pwTextField, signUpButton,signInButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Logo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
        }
        Logotext.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(Logo.snp.top).offset(55)
        }
        emailTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(280)
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
            $0.top.equalToSuperview().offset(380)
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
        signInButton.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.trailing.equalTo(view.snp.centerX).offset(-70)
        }
        
    }
    
}
