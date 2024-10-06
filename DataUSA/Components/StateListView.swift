//
//  StateListView.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//
import Foundation
import SwiftUI

struct StateListView: View {
    
    @StateObject private var viewModel: StateViewModel = DependencyContainer.stateViewModel
    @State private var showingAlert: Bool = false
    @Environment(\.errorMessage) var errorMessage
    
    var body: some View {
        List {
            ForEach(viewModel.states) { element in
                VStack {
                    Text("\(element.state)")
                        .font(.title2)
                    
                    HStack {
                        VStack(spacing: 3) {
                            Image(systemName: "calendar")
                            Text("\(element.year)")
                            
                        }
                        Spacer()
                        VStack(spacing: 3) {
                            Image(systemName: "person.3.fill")
                            Text("\(element.population)")
                        }
                    }
                }
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getStatesData()
        }.onReceive(viewModel.$hasError) { error in
            errorMessage.showingError = error
        }
    }
}
