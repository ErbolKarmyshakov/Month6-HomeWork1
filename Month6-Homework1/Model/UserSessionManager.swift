//
//  UserSessionManager.swift
//  Month6-Homework1
//
//  Created by Mac User on 4/1/24.
//

import Foundation

class UserSessionManager {
    
    static let shared = UserSessionManager()
    
    private init() {   }
    
    func saveUserSession(_ user: PersonStruct) {
        let twoMinute = Calendar.current.date(
            byAdding: .minute,
            value: 1,
            to: Date()
        )!
        UserDefaultManager.shared.setValue(twoMinute, forKey: .session)
        let jsonEncoder = JSONEncoder()
        if let data = try? jsonEncoder.encode(user) {
            UserDefaultManager.shared.setValue(data, forKey: .person )
        }
    }
    
    func getSession() -> Date? {
        UserDefaultManager.shared.getDate(forKey: .session)
    }
    
    func deleteSession() {
        UserDefaultManager.shared.removeObject(forkey: .session)
    }
    
    func getPersonInfo() -> PersonStruct? {
        guard let data = UserDefaultManager.shared.getData(forKey: .person) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(PersonStruct.self, from: data)
    }
}
