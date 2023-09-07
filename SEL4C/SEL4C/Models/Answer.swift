//
//  Answer.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 28/08/23.
//

import Foundation

struct Answer: Hashable, Codable {
    // MARK: Attributes
    var answer_array: [Int]
    
    // MARK: Methods
    // Constructor Method
    init(answer_array: [Int]){
        self.answer_array = answer_array
    }
    
    // Main Evaluation
    func getMarks() -> Int{
        var sum: Int = 0
        for answer in self.answer_array {
            sum += answer
        }
        
        return sum
    }
}
