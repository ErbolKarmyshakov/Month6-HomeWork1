//
//  UserDefaultsManager.swift
//  Month6-Homework1
//
//  Created by Mac User on 4/1/24.
//

import Foundation

class UserDefaultManager {
    
    enum UserDefaultKeys: String {
        case session = "userSession"
        case phone = "userPhone"
        case person = "person"
    }
    
    static let shared = UserDefaultManager()
    
    private init() { }
    
    func setValue(_ value: Date, forKey key: UserDefaultKeys) {
        UserDefaults.standard.set(date: value, forKey: key.rawValue)
    }
    
    func setValue(_ value: Any, forKey key: UserDefaultKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getString(forkey key: UserDefaultKeys) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    func getDate(forKey key: UserDefaultKeys) -> Date? {
        return UserDefaults.standard.date(forKey: key.rawValue)
    }
    
    func getData(forKey key: UserDefaultKeys) -> Data? {
        return UserDefaults.standard.data(forKey: key.rawValue)
    }
    
    func removeObject(forkey key: UserDefaultKeys) {
        return UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}

extension UserDefaults {
    func set(date: Date?, forKey key: String) {
        self.set(date, forKey: key)
    }
    
    func date(forKey key: String) -> Date? {
        return self.value(forKey: key) as? Date
    }
}
