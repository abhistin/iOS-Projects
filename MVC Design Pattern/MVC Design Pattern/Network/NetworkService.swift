//
//  NetworkService.swift
//  MVC Design Pattern
//
//  Created by Abhishek Bhardwaj on 02/11/23.
//

import Foundation
class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    private var user: User?
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(UInt32(0.9))
            DispatchQueue.main.async {
                if email == "test@test.com" && password == "password" {
                    self.user = User(firstName: "Abhistin", lastName: "Bhardwaj", email: "test@test.com", age: 23, location: Location(lat: 2.48394, lng: -7.458374))
                    completion(true)
                }
                else {
                    self.user = nil
                    completion(false)
                }
            }
        }
    }
    func getLoggedInUser() -> User? {
        return user
    }
}
