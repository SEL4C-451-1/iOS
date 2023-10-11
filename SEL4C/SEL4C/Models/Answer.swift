//
//  Answer.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 28/08/23.
//

import Foundation

struct Answer: Codable {
    // MARK: Attributes
    var answerArray: [Int]
    var autocontrolGrade: Float
    var liderazgolGrade: Float
    var concienciaSocialGrade: Float
    var innovacionSocialFinancieraGrade: Float
    var pensamientoSistemicoGrade: Float
    var pensamientoCriticoGrade: Float
    var pensamientoCientificoGrade: Float
    var pensamientoInnovadorGrade: Float
    
    // MARK: Methods
    // Constructor Method
    init(){
        self.answerArray = []
        self.autocontrolGrade = 0.0
        self.liderazgolGrade = 0.0
        self.concienciaSocialGrade = 0.0
        self.innovacionSocialFinancieraGrade = 0.0
        self.pensamientoSistemicoGrade = 0.0
        self.pensamientoCriticoGrade = 0.0
        self.pensamientoCientificoGrade = 0.0
        self.pensamientoInnovadorGrade = 0.0
    }
    
    // Main Evaluation
    func getMarks() -> Int {
        var sum: Int = 0
        for answer in self.answerArray {
            sum += answer
        }
        
        return sum
    }
    
    // Calculate Subevaluations
    
    mutating func calculateSubevaluations(){
        // Instrumento de Perfil Emprendedor (Calificaciones)
        autocontrolGrade = Float(answerArray[0] + answerArray[1] + answerArray[2] + answerArray[3]) / 4.0 * 20.0
        liderazgolGrade = Float(answerArray[4] + answerArray[5] + answerArray[6] + answerArray[7] + answerArray[8] + answerArray[9]) / 6.0 * 20.0
        concienciaSocialGrade = Float(answerArray[10] + answerArray[11] + answerArray[12] + answerArray[13] + answerArray[14] + answerArray[15] + answerArray[16]) / 7.0 * 20.0
        innovacionSocialFinancieraGrade = Float(answerArray[17] + answerArray[18] + answerArray[19] + answerArray[20] + answerArray[21] + answerArray[22] + answerArray[23]) / 7.0 * 20.0
        
        // Instrumento de eComplexity (Calificaciones)
        pensamientoSistemicoGrade = Float(answerArray[24] + answerArray[25] + answerArray[26] + answerArray[27] + answerArray[28] + answerArray[29]) / 6.0 * 20.0
        pensamientoCientificoGrade = Float(answerArray[30] + answerArray[31] + answerArray[32] + answerArray[33] + answerArray[34] + answerArray[35] + answerArray[36]) / 7.0 * 20.0
        pensamientoCriticoGrade = Float(answerArray[37] + answerArray[38] + answerArray[39] + answerArray[40] + answerArray[41] + answerArray[42]) / 6.0 * 20.0
        pensamientoInnovadorGrade = Float(answerArray[37] + answerArray[38] + answerArray[39] + answerArray[40] + answerArray[41] + answerArray[42]) / 6.0 * 20.0
        
        
    }
    
    // Method that sends user information to DB.
    func setAnswers(isInitial: Bool) async throws -> Bool {
        var prsentAlert: Bool = false
        
        // Prepare URL
        let urlString: String
        if(isInitial){
            urlString = "http://ec2-54-183-198-5.us-west-1.compute.amazonaws.com/sel4c/user/scores/initial/"
        }else{
            urlString = "http://ec2-54-183-198-5.us-west-1.compute.amazonaws.com/sel4c/user/scores/final/"
        }
        let url = URL(string: urlString)
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let jsonEncoder = JSONEncoder()
        let answerInfo = AnswerInfo(answer: self)
        let jsonData = try? jsonEncoder.encode(answerInfo)

        // Set HTTP Request Body
        request.httpBody = jsonData
        // Perform HTTP Request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
            prsentAlert = true
            throw UserError.itemNotFound
        }
        
        return prsentAlert
    }
    
    mutating func parseResults(results: [String: Any]){
        self.autocontrolGrade = (results["self_control_score"]! as? Float)!
        self.liderazgolGrade = (results["leadership_score"]! as? Float)!
        self.concienciaSocialGrade = (results["consciousness_and_social_value_score"]! as? Float)!
        self.innovacionSocialFinancieraGrade = (results["social_innovation_and_financial_sustainability_score"]! as? Float)!
        self.pensamientoSistemicoGrade = (results["systemic_thinking_score"]! as? Float)!
        self.pensamientoCriticoGrade = (results["critical_thinking_score"]! as? Float)!
        self.pensamientoCientificoGrade = (results["scientific_thinking_score"]! as? Float)!
        self.pensamientoInnovadorGrade = (results["innovative_thinking_score"]! as? Float)!
    }
}

struct AnswerInfo: Codable {
    var self_control_score: Int
    var leadership_score: Int
    var consciousness_and_social_value_score: Int
    var social_innovation_and_financial_sustainability_score: Int
    var systemic_thinking_score: Int
    var scientific_thinking_score: Int
    var critical_thinking_score: Int
    var innovative_thinking_score: Int
    
    init() {
        self.self_control_score = 0
        self.leadership_score = 0
        self.consciousness_and_social_value_score = 0
        self.social_innovation_and_financial_sustainability_score = 0
        self.systemic_thinking_score = 0
        self.scientific_thinking_score = 0
        self.critical_thinking_score = 0
        self.innovative_thinking_score = 0
    }
    
    init(answer: Answer) {
        self.self_control_score = Int(answer.autocontrolGrade)
        self.leadership_score = Int(answer.liderazgolGrade)
        self.consciousness_and_social_value_score = Int(answer.concienciaSocialGrade)
        self.social_innovation_and_financial_sustainability_score = Int(answer.innovacionSocialFinancieraGrade)
        self.systemic_thinking_score = Int(answer.pensamientoSistemicoGrade)
        self.scientific_thinking_score = Int(answer.pensamientoCientificoGrade)
        self.critical_thinking_score = Int(answer.pensamientoCriticoGrade)
        self.innovative_thinking_score = Int(answer.pensamientoInnovadorGrade)
    }
    
    func getAnswers(isInitial: Bool) async throws -> [String: Any] {
        // Prepare URL
        let urlString: String
        if(isInitial){
            urlString = "http://ec2-54-183-198-5.us-west-1.compute.amazonaws.com/sel4c/user/scores/initial/"
        }else{
            urlString = "http://ec2-54-183-198-5.us-west-1.compute.amazonaws.com/sel4c/user/scores/final/"
        }
        
        let url = URL(string: urlString)
        
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
        
        guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
            throw UserError.itemNotFound
        }
        if(jsonResponse.isEmpty){
            throw UserError.itemNotFound
        }
        
        return jsonResponse[0]
    }
}

