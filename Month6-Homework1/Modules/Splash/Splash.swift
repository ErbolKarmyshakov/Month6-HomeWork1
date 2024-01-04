//
//  Splash.swift
//  Month6-Homework1
//
//  Created by Mac User on 6/1/24.
//

import Foundation
import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           if let sessionDate = UserSessionManager.shared.getSession(),
           sessionDate < Date() {
               let vc = InfoViewController()
               present(vc, animated: true)
           } else {
               let vc = UserAuthorizationViewController()
               present(vc, animated: true)
               UserSessionManager.shared.deleteSession()
           }
       }
}
