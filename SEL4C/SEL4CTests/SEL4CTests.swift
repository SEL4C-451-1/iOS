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
        let user = User(userName: "Admin", email: "admin@example.com", password: "password")
        
        // Token Keys
        let tokenReal: String = "8c26c3d5f37c940150ae7d4524a444eb252fba3f"
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
        let tokenReal: String = "8c26c3d5f37c940150ae7d4524a444eb252fba3f"
        var tokenApi: String
        
        // Validation of Non-Empty Fields and Valid Email
        let fieldsNotEmpty: Bool = !user.userName.isEmpty && !user.email.isEmpty && !user.password.isEmpty
        let validEmail: Bool = await login.isValidEmail(user.email)
        
        // Call API and Assert equality
        do{
            tokenApi = try await user.getToken()
            XCTAssertFalse(tokenReal == tokenApi && fieldsNotEmpty && validEmail)
        }catch{
            tokenApi = ""
        }
    }
    
    func testCP_02_Register_Valid() async {
        // Instantiation of things needed
        let signUp = await SignUpEssentialsViewController()
        let signUpContinue = await SignUpEssentials2ViewController()
        let user = User(userName: "Admin", email: "example@example.com", password: "Password123")
        let confirmationPassword: String = "Password123"
        
        // Mark the Accept Terms and Conditions Button as read.
        let buttonTermsConditionsIsSelected: Bool = true
        
        // Validation of Non-Empty Fields, Valid Email and Valid Password
        let fieldsNotEmpty: Bool = !user.userName.isEmpty && !user.email.isEmpty && !user.password.isEmpty
        let validEmail: Bool = await signUp.isValidEmail(user.email)
        let validPassword: Bool = user.password == confirmationPassword
        
        // Return if there should be an alert
        var showAlert: Bool
        
        // Call API and Assert equality
        do{
            showAlert = try await user.create()
            XCTAssertTrue(!showAlert && fieldsNotEmpty && validEmail && buttonTermsConditionsIsSelected && validPassword)
        }catch{
            showAlert = true
        }
    }
    
    func testCP_02_Register_Invalid() async {
        // Instantiation of things needed
        let signUp = await SignUpEssentialsViewController()
        let signUpContinue = await SignUpEssentials2ViewController()
        let user = User(userName: "Admin", email: "exampleExamplecom", password: "password")
        let confirmationPassword: String = "Password123"
        
        // Mark the Accept Terms and Conditions Button as read.
        let buttonTermsConditionsIsSelected: Bool = false
        
        // Validation of Non-Empty Fields, Email and Password
        let fieldsNotEmpty: Bool = !user.userName.isEmpty && !user.email.isEmpty && !user.password.isEmpty
        let validEmail: Bool = await signUp.isValidEmail(user.email)
        let validPassword: Bool = user.password == confirmationPassword
       
        // Return if there shuold be an alert
        var showAlert: Bool
        
        // Call API and Assert equality
        do{
            showAlert = try await user.create()
            XCTAssertFalse(!showAlert && fieldsNotEmpty && validEmail && buttonTermsConditionsIsSelected && validPassword)
        }catch{
            showAlert = true
        }
    }
    
    func testCP_03_Form_Valid() async {
        // Initialize the Answer object with the valid data.
        var answer = Answer()
        let answerArray:[Int] = [Int](repeating: 1, count: 49)
        answer.answerArray = answerArray
        
        // Check that Answer results agree.
        answer.calculateSubevaluations()
        let subevaluation1: Bool = answer.autocontrolGrade == 20.0
        let subevaluation2: Bool = answer.liderazgolGrade == 20.0
        let subevaluation3: Bool = answer.concienciaSocialGrade == 20.0
        let subevaluation4: Bool = answer.innovacionSocialFinancieraGrade == 20.0
        let subevaluation5: Bool = answer.pensamientoSistemicoGrade == 20.0
        let subevaluation6: Bool = answer.pensamientoCientificoGrade == 20.0
        let subevaluation7: Bool = answer.pensamientoCriticoGrade == 20.0
        let subevaluation8: Bool = answer.pensamientoInnovadorGrade == 20.0
        let subevaluationsValidity: Bool = subevaluation1 && subevaluation2 && subevaluation3 && subevaluation4 && subevaluation5 && subevaluation6 && subevaluation7 && subevaluation8
        
        XCTAssertTrue(subevaluationsValidity)
    }
    
    func testCP_03_Form_Invalid() async {
        // Initialize the Answer object with the invalid data.
        var answer = Answer()
        
        XCTAssertTrue(answer.answerArray.isEmpty)
    }
    
    func testCP_04_Activities_Valid() async {
        // Instantiation of things needed
        let user = User(userName: "Admin", email: "admin@example.com", password: "password")
        
        // Token Keys
        var tokenApi: String
        
        // Call API and get token
        do{
            tokenApi = try await user.getToken()
            UserDefaults.standard.set(tokenApi, forKey: "token")
            
            // Mark Activity 1 as completed
            do{
                let activityResponse = try ActivityResponse(string_response: "complete")
                try await activityResponse.setStatus(activityNumber: "1")
                
                // Check if the activity 1 was set as completed
                do{
                    try await activityResponse.getStatus()
                }catch{
                    XCTAssertTrue(UserDefaults.standard.bool(forKey: "actividadTerminada1"))
                }
            }
        }catch{
            tokenApi = ""
        }
    }
    
    func testCP_04_Activities_Invalid() async {
        // Instantiation of things needed
        let user = User(userName: "Admin", email: "admin@example.com", password: "password")
        
        // Token Keys
        var tokenApi: String
        
        // Call API and get token
        do{
            tokenApi = try await user.getToken()
            UserDefaults.standard.set(tokenApi, forKey: "token")
            
            // Mark Activity 1 as completed
            do{
                let activityResponse = try ActivityResponse(string_response: "incomplete")
                try await activityResponse.setStatus(activityNumber: "1")
                
                // Check if the activity 1 was set as completed
                do{
                    try await activityResponse.getStatus()
                }catch{
                    XCTAssertFalse(UserDefaults.standard.bool(forKey: "actividadTerminada1"))
                }
            }
        }catch{
            tokenApi = ""
        }
    }
    
    func testCP_05_Logout_Valid() {
        // Initialize the UserDefault's token to a given value
        UserDefaults.standard.set("8c26c3d5f37c940150ae7d4524a444eb252fba3f", forKey: "token")
        
        // Log out by resetting the UserDefaults
        UserDefaults.standard.reset()
        
        XCTAssertNil(UserDefaults.standard.string(forKey: "token"))
    }
    
    func testCP_05_Logout_Invalid() {
        // Initialize the UserDefault's token to a given value
        UserDefaults.standard.set("8c26c3d5f37c940150ae7d4524a444eb252fba3f", forKey: "token")
        
        // Assert without resetting the UserDefault
        XCTAssertNotNil(UserDefaults.standard.string(forKey: "token"))
    }
    
}
