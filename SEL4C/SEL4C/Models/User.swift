//
//  User.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 21/09/23.
//

import Foundation

struct User: Codable {
    // MARK: User's Attributes
    var userName: String
    var email: String
    var emailRecover: String
    var password: String
    var academicDegree: String
    var institution: String
    var discipline: String
    var gender: String
    var age: Int
    var country: String
    
    // MARK: Cuenta's Methods
    init(userName: String, email: String, emailRecover: String, password: String) {
        self.userName = userName
        self.email = email
        self.emailRecover = emailRecover
        self.password = password
        self.academicDegree = "Pregrado"
        self.institution = "Tecnológico de Monterrey"
        self.discipline = "Ingeniería y Ciencias"
        self.gender = "Masculino"
        self.age = -1
        self.country = "Afganistán"
    }
    
    func printUser(){
        print("[*] User:")
        print(" -  \(self.userName)")
        print(" -  \(self.email)")
        print(" -  \(self.emailRecover)")
        print(" -  \(self.password)")
        print(" -  \(self.academicDegree)")
        print(" -  \(self.institution)")
        print(" -  \(self.discipline)")
        print(" -  \(self.gender)")
        print(" -  \(self.age)")
        print(" -  \(self.country)")
    }
}
