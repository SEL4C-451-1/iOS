//
//  QuestionData.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 28/08/23.
//

import Foundation

var questions: [Question] = load("preguntas.json")
var countries: [String] = countryToSpanish(jsonFile: "countries.json")

func countryToSpanish(jsonFile: String) -> [String]{
    var countries: [Country] = load(jsonFile)
    var countriesSpanish: [String] = []
    for country in countries{
        countriesSpanish.append(country.es_name)
    }
    
    return countriesSpanish
}
