//
//  ErrorMessage.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Foundation

class ErrorMessage: ObservableObject {
    @Published var showingError: Bool = false
    var errorTitle: String = ""
    var errorMessage: String = ""
}
