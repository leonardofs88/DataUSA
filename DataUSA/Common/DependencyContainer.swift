//
//  DependencyContainer.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//
import Combine
import Foundation

struct DependencyContainer {
    static var networkService = NetworkService()
    static var stateRepository = StateRepository(networkService: networkService)
    static var stateViewModel = StateViewModel()
}
