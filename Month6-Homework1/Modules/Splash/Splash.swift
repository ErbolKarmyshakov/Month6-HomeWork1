//
//  Splash.swift
//  Month6-Homework1
//
//  Created by Mac User on 6/1/24.
//

import Foundation
import UIKit

class SplashController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let sessionDate = UserSessionManager.shared.getSession(),
           sessionDate > Date() {
            let vc = InfoViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            print("active")
            self.viewDidLoad()
        } else {
            let vc = UserAuthorizationViewController()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            print("notactive")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.viewDidLoad()
    }
}
