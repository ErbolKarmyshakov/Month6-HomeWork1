//
//  ViewController.swift
//  Month6-Homework1
//
//  Created by Mac User on 4/1/24.
//

import UIKit

class UserAuthorizationViewController: UIViewController {
    
    private let vc = InfoViewController()
    
    private let nameTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.brown.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let surNameTf: UITextField = {
        let view = UITextField()
        view.placeholder = "SurName"
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.brown.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneNumTf: UITextField = {
        let view = UITextField()
        view.placeholder = "PhoneNumber"
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.brown.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let continueBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Continue", for: .normal)
        view.backgroundColor = .brown
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEnabled = true
        view.tintColor  =  .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        allSetUpConstraints()
    }
    
    private func allSetUpConstraints() {
        setUpConstraintsForNameTf()
        setUpConstraintsForSurNameTf()
        setUpConstraintsForPhoneNumberTf()
        setUpConstraintsForContinueBtn()
    }
    
    private func setUpConstraintsForNameTf() {
        view.addSubview(nameTf)
        NSLayoutConstraint.activate([
            nameTf.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 50
            ),
            nameTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTf.widthAnchor.constraint(equalToConstant: 200),
            nameTf.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpConstraintsForSurNameTf() {
        view.addSubview(surNameTf)
        NSLayoutConstraint.activate([
            surNameTf.topAnchor.constraint(
                equalTo: nameTf.bottomAnchor,
                constant: 50
            ),
            surNameTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surNameTf.widthAnchor.constraint(equalToConstant: 200),
            surNameTf.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpConstraintsForPhoneNumberTf() {
        view.addSubview(phoneNumTf)
        NSLayoutConstraint.activate([
            phoneNumTf.topAnchor.constraint(
                equalTo: surNameTf.bottomAnchor,
                constant: 50
            ),
            phoneNumTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneNumTf.widthAnchor.constraint(equalToConstant: 200),
            phoneNumTf.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpConstraintsForContinueBtn() {
        view.addSubview(continueBtn)
        NSLayoutConstraint.activate([
            continueBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                constant: -150
                                               ),
            continueBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueBtn.widthAnchor.constraint(equalToConstant: 200),
            continueBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        continueBtn.addTarget(
            self,
            action: #selector(signInBtnTapped),
            for: .touchUpInside
        )
    }
    
    private func validated() -> Bool {
        guard let name = nameTf.text,
              let surname = surNameTf.text,
              !name.isEmpty,
              !surname.isEmpty,
              name.count >= 5,
              surname.count >= 8
        else {
            return false
        }
        return true
    }
    
    @objc
    private func signInBtnTapped() {
        if validated() {
            UserSessionManager.shared.saveUserSession(
                PersonStruct(
                    name: nameTf.text!,
                    surname: surNameTf.text!,
                    phoneNum: phoneNumTf.text!
                )
            )
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}

