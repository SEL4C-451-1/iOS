//
//  QuestionData.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 28/08/23.
//

import Foundation

// Reading JSON of Questions
var questions: [Question] = load("preguntas.json")

// Reading JSON of Countries (in Spanish)
var countries: [String] = countryToSpanish(jsonFile: "countries.json")
func countryToSpanish(jsonFile: String) -> [String]{
    let countries: [Country] = load(jsonFile)
    var countriesSpanish: [String] = []
    for country in countries{
        countriesSpanish.append(country.es_name)
    }
    
    return countriesSpanish
}

// Reading JSON of Activities
var activities: [Activity] = load("activities.json")
