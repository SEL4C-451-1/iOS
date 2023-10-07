//
//  SEL4CTests.swift
//  SEL4CTests
//
//  Created by Moisés Adame Aguilar on 04/10/23.
//

import XCTest
@testable import SEL4C

final class SEL4CTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCP_01_Login_Valid() async {
        // Instantiation of things needed
        let login = await LogInViewController()
        let user = User(userName: "Admin", email: "admin@example.com", password: "admin@example.com")
        
        // Token Keys
        let tokenReal: String = "570aee6bdb5e2a26227b75f6082d3b18a07c7bdd"
        var tokenApi: String
        
        // Validation of Non-Empty Fields and Valid Email
        let fieldsNotEmpty: Bool = !user.userName.isEmpty && !user.email.isEmpty && !user.password.isEmpty
        let validEmail: Bool = await login.isValidEmail(user.email)
        
        // Call API and Assert equality
        do{
            tokenApi = try await user.getToken()
            XCTAssertTrue(tokenReal == tokenApi && fieldsNotEmpty && validEmail)
        }catch{
            tokenApi = ""
        }
    }
    
    func testCP_01_Login_Invalid() async {
        // Instantiation of things needed
        let login = await LogInViewController()
        let user = User(userName: "Admin", email: "@l.com", password: "password")
        
        // Token Keys
        let tokenReal: String = "570aee6bdb5e2a26227b75f6082d3b18a07c7bdd"
        var tokenApi: String
        
        // Validation of Non-Empty Fields and Valid Email
        let fieldsNotEmpty: Bool = !user.userName.isEmpty && !user.email.isEmpty && !user.password.isEmpty
        let validEmail: Bool = await login.isValidEmail(user.email)
        
        // Call API and Assert equality
        do{
            tokenApi = try await user.getToken()
            XCTAssertTrue(tokenReal == tokenApi && fieldsNotEmpty && validEmail)
        }catch{
            tokenApi = ""
        }
    }
    
    func testCP_02_Register_Valid() async {
        // Instantiation of things needed
        let signUp = await SignUpEssentialsViewController()
        let signUpContinue = await SignUpEssentials2ViewController()
        let user = User(userName: "Admin", email: "example@example.com", password: "Password123")
        
        // Mark the Accept Terms and Conditions Button as read.
        let buttonTermsConditionsIsSelected: Bool = true
        
        // Validation of Non-Empty Fields and Valid Email
        let fieldsNotEmpty: Bool = !user.userName.isEmpty && !user.email.isEmpty && !user.password.isEmpty
        let validEmail: Bool = await signUp.isValidEmail(user.email)
       
        
        // Return if there shuold be an alert
        var showAlert: Bool
        
        // Call API and Assert equality
        do{
            showAlert = try await user.create()
            XCTAssertTrue(!showAlert && fieldsNotEmpty && validEmail && buttonTermsConditionsIsSelected)
        }catch{
            showAlert = true
        }
    }
}
