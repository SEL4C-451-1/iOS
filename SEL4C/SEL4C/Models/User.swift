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
    var password: String
    var academicDegree: String
    var institution: String
    var discipline: String
    var gender: String
    var age: Int
    var country: String
    
    // MARK: Cuenta's Methods
    init(userName: String, email: String, password: String) {
        self.userName = userName
        self.email = email
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
        print(" -  \(self.password)")
        print(" -  \(self.academicDegree)")
        print(" -  \(self.institution)")
        print(" -  \(self.discipline)")
        print(" -  \(self.gender)")
        print(" -  \(self.age)")
        print(" -  \(self.country)")
    }
    
    // Method that crestes the user in the API.
    func create() async throws -> Bool {
        var prsentAlert: Bool = true
        
        // Prepare URL
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/user/create")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let jsonEncoder = JSONEncoder()
        let userCreate = UserCreate(email: self.email, password: self.password, name: self.userName)
        let jsonData = try? jsonEncoder.encode(userCreate)

        // Set HTTP Request Body
        request.httpBody = jsonData

        // Perform HTTP Request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 400 else {
            throw UserError.itemNotFound
        }
        
        prsentAlert = false
        return prsentAlert
    }
    
    // Method that gets the token
    func getToken() async throws -> String {
        
        // Prepare URL
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/user/token/")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let jsonEncoder = JSONEncoder()

        let userCreate = UserCreate(email: email, password: password, name: userName)
        //let userCreate = UserCreate(email: "test2@tec.mx", password: "Test2", name: "Test2")
        let jsonData = try? jsonEncoder.encode(userCreate)

        // Set HTTP Request Body
        request.httpBody = jsonData

        // Perform HTTP Request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserError.itemNotFound
        }
        
        guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw UserError.itemNotFound
        }
        
        return jsonResponse["token"]! as! String
    }
}

enum UserError: Error, LocalizedError {
    case itemNotFound
}

struct UserCreate: Codable{
    var email: String
    var password: String
    var name: String
    
    init(email: String, password: String, name: String) {
        self.email = email
        self.password = password
        self.name = name
    }
}
