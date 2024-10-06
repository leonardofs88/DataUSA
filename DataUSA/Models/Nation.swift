//
//  Nation.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Foundation

struct Nation: Codable, Identifiable {
    let id: String = UUID().uuidString
    let idNation: String
    let nation: String
    let idYear: Int
    let year: String
    let population: Int
    let slugNation: String
    
    private enum CodingKeys: String, CodingKey {
        case idNation = "ID Nation"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
}

extension Nation: Equatable {
    static func == (lhs: Nation, rhs: Nation) -> Bool {
        lhs.idNation == rhs.idNation &&
        lhs.nation == rhs.nation &&
        lhs.idYear == rhs.idYear &&
        lhs.year == rhs.year &&
        lhs.population == rhs.population &&
        lhs.slugNation == rhs.slugNation
    }
}
