//
//  ContentView.swift
//  DataUSA
//
//  Created by Leonardo Soares on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: StateViewModel = DependencyContainer.stateViewModel
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Population")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.getStatesData()
            }
            .onReceive(viewModel.$hasError) { hasError in
                showingAlert = hasError
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(viewModel.errorCase.0), message: Text(viewModel.errorCase.1))
            }
            
        }
    }
}

#Preview {
    ContentView()
}
