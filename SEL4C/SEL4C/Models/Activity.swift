//
//  Activity.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 22/09/23.
//

import Foundation

struct Activity: Codable {
    var activityName: String
    var activityNumber: String
    var subactivities: [Subactivity]
}

struct Subactivity: Codable {
    var subactivityName: String
    var instructions: Instructions
    var deliverable: String
}

struct Instructions: Codable {
    var text: String
    var bullets: [String]
}

struct ActivityResponse: Codable {
    var response_type: String?
    var string_response: String?
    var image_response: String?
    var video_response: String?
    var audio_response: String?
    var time_minutes: Int?
    
    init(string_response: String) throws {
        self.response_type = "text"
        self.string_response = string_response
        self.image_response = nil
        self.video_response = nil
        self.audio_response = nil
        self.time_minutes = -1
    }
    
    func setStatus(activityNumber: String) async throws -> Void {
        // Prepare URL
        let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/response/activity/\(activityNumber)/upload-response/")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
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
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
            throw UserError.itemNotFound
        }
    }
    
    func getStatus() async throws -> Void {
        // Prepare URL
        let activities: [Int] = [1, 2, 3, 4, 5, 6, 7]
        let activitiesKeys: [String] = ["actividadTerminada1", "actividadTerminada2", "actividadTerminada3", "actividadTerminada4", "actividadTerminada5", "evaluacionFinalTerminada"]
        
        for activityNumber in activities {
            let url = URL(string: "http://ec2-54-219-232-127.us-west-1.compute.amazonaws.com/sel4c/response/activity/\(activityNumber)/")
            guard let requestUrl = url else { fatalError() }

            // Prepare URL Request Object
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Token \(UserDefaults.standard.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
            
            
            if(activities[activities.count - 1] == activityNumber){
                throw UserError.itemNotFound
            }
            
            // Perform HTTP Request
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
                throw UserError.itemNotFound
            }
            
            if(jsonResponse[0]["string_response"]! as? String? == "complete"){
                UserDefaults.standard.set(true, forKey: activitiesKeys[activityNumber - 1])
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw UserError.itemNotFound
            }
            
            
        }
    }
}

