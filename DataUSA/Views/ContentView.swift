//
//  ContentView.swift
//  DataUSA
//
//  Created by Leonardo Soares on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: PopulationViewModel
    @State private var showingAlert = false
    
    init(viewModel: PopulationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.populationData) { element in
                HStack {
                    VStack(spacing: 3) {
                        Image(systemName: "calendar")
                        Text(element.yearText)
                    }
                    Spacer()
                    VStack(spacing: 3) {
                        Image(systemName: "person.3.fill")
                        Text(element.populationText)
                    }
                }
            }
            .padding()
            .navigationTitle("Population")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.getData()
            }
            .onReceive(viewModel.$hasError) { hasError in
                showingAlert = hasError
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }
            
        }
    }
}

#Preview {
    ContentView(viewModel: PopulationViewModel(service: DependencyContainer.getService(),
                                               repository: Repository()))
}
