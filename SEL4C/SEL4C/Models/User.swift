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
        self.age = 15
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
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/user/create/")
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
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 201 else {
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

        let userCreate = UserCreate(email: self.email, password: "\(self.password)", name: self.userName)
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
    
    // Method that sends user information to DB.
    func setInfo() async throws -> Bool {
        var prsentAlert: Bool = false
        
        // Prepare URL
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/user/info/add/")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let jsonEncoder = JSONEncoder()
        let userInfo = UserInfo(full_name: self.userName, academic_degree: self.academicDegree, institution: self.institution, gender: self.gender, age: self.age, country: self.country, discipline: self.discipline)
        let jsonData = try? jsonEncoder.encode(userInfo)

        // Set HTTP Request Body
        request.httpBody = jsonData
        
        // Perform HTTP Request
        let (data, response) = try await URLSession.shared.data(for: request)
    
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
            prsentAlert = true
            throw UserError.itemNotFound
        }
        
        guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            prsentAlert = true
            throw UserError.itemNotFound
        }
        
        return prsentAlert
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

struct UserInfo: Codable {
    var full_name: String
    var academic_degree: String
    var institution: String
    var gender: String
    var age: Int
    var country: String
    var discipline: String
    
    init(full_name: String, academic_degree: String, institution: String, gender: String, age: Int, country: String, discipline: String) {
        self.full_name = full_name
        self.academic_degree = academic_degree
        self.institution = institution
        self.gender = gender
        self.age = age
        self.country = country
        self.discipline = discipline
    }
    
    init() {
        self.full_name = ""
        self.academic_degree = ""
        self.institution = ""
        self.gender = ""
        self.age = -1
        self.country = ""
        self.discipline = ""
    }
    
    mutating func setvalues(_ values: [String: Any]){
        self.full_name = values["full_name"]! as! String
        self.academic_degree = values["academic_degree"]! as! String
        self.institution = values["institution"]! as! String
        self.gender = values["gender"]! as! String
        self.age = values["age"]! as! Int
        self.country = values["country"]! as! String
        self.discipline = values["discipline"]! as! String
    }
    
    func getInfo() async throws -> [String: Any] {
        // Prepare URL
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/user/info/me/")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        
        // Perform HTTP Request
        let (data, response) = try await URLSession.shared.data(for: request)
    
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserError.itemNotFound
        }
        
        guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw UserError.itemNotFound
        }
        
        return jsonResponse
    }
    
    func putInfo() async throws -> Void{
        // Prepare URL
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/user/info/me/")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(self)
        
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
        
        print(jsonResponse)
    }
}
