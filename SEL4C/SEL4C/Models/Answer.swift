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
    
}
