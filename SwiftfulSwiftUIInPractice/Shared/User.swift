//
//  User.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 20.05.24.
//

import Foundation

struct UserResult: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
}

extension User {
    static var mock: User {
        User(
            id: 444,
            firstName: "Nick",
            lastName: "Sarno",
            age: 76,
            email: "hi@email.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImageUrl,
            height: 180,
            weight: 180
        )
    }
}
