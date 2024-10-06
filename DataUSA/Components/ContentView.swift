//
//  ContentView.swift
//  DataUSA
//
//  Created by Leonardo Soares on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    @State var errorMessage: ErrorMessage = ErrorMessage()
    @State var currentSelection: MeasureType = .nation
    @State var showingAlert = false
    
    private let types = ["Nation", "State"]
    
    var body: some View {
        NavigationStack {
            Picker("Population data", selection: $currentSelection) {
                ForEach(MeasureType.allCases, id: \.self) { type in
                    Text(types[type.rawValue]).tag(type)
                }
            }
            .padding()
            .colorMultiply(.orange)
            .pickerStyle(.segmented)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Population")
            
            DisplayView(currentSelection: $currentSelection)
                .environment(\.errorMessage, errorMessage)
                .onReceive(errorMessage.$showingError) { hasError in
                    showingAlert = hasError
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(errorMessage.errorTitle), message: Text(errorMessage.errorMessage))
                }
        }
    }
}

#Preview {
    ContentView()
}
