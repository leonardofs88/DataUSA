//
//  StatePopulation.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Foundation

struct StatePopulation: Codable, Identifiable {
    let id: String = UUID().uuidString
    let idState: String
    let state: String
    let idYear: Int
    let year: String
    let population: Int
    let slugState: String
    
    public enum CodingKeys: String, CodingKey {
        case idState = "ID State"
        case state = "State"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugState = "Slug State"
    }
}

extension StatePopulation: Equatable {
    static func == (lhs: StatePopulation, rhs: StatePopulation) -> Bool {
        lhs.idState == rhs.idState &&
        lhs.state == rhs.state &&
        lhs.idYear == rhs.idYear &&
        lhs.year == rhs.year &&
        lhs.population == rhs.population &&
        lhs.slugState == rhs.slugState
    }
}
