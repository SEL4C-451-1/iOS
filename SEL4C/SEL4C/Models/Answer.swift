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
    
    // MARK: Methods
    // Constructor Method
    init(){
        self.answerArray = []
    }
    
    // Main Evaluation
    func getMarks() -> Int{
        var sum: Int = 0
        for answer in self.answerArray {
            sum += answer
        }
        
        return sum
    }
}
