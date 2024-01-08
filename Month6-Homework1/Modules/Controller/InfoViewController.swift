//
//  InfoViewController.swift
//  Month6-Homework1
//
//  Created by Mac User on 5/1/24.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    var person: PersonStruct?
     
    private let nameLbl: UILabel = {
        let view = UILabel()
        view.textColor = .brown
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let surNameLbl: UILabel = {
        let view = UILabel()
        view.textColor = .brown
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneNumLbl: UILabel = {
        let view = UILabel()
        view.textColor = .brown
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetUpConstraints()
    }
    
    private func allSetUpConstraints() {
        view.backgroundColor =  .systemBackground
        setUpConstraintsForNameLbl()
        setUpConstraintsForSurNameLbl()
        setUpConstraintsForPhoneNumberLbl()
    }
    
    private func setUpConstraintsForNameLbl() {
        view.addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,                             constant: 70
                                            ),
            nameLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setUpConstraintsForSurNameLbl() {
        view.addSubview(surNameLbl)
        NSLayoutConstraint.activate([
            surNameLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 40),
            surNameLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setUpConstraintsForPhoneNumberLbl() {
        view.addSubview(phoneNumLbl)
        NSLayoutConstraint.activate([
            phoneNumLbl.topAnchor.constraint(equalTo: surNameLbl.bottomAnchor,
                                             constant: 40
                                            ),
            phoneNumLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
