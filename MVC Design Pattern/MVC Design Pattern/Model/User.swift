//
//  User.swift
//  MVC Design Pattern
//
//  Created by Abhishek Bhardwaj on 02/11/23.
//

import Foundation

struct User {
    let firstName, lastName, email: String
    let age: Int
    let location: Location
}

struct Location {
    let lat, lng: Double
}
