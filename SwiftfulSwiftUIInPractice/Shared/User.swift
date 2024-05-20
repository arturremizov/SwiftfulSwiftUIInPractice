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
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
}
