//
//  NationListView.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import SwiftUI
import Foundation

struct NationListView: View {
    
    @StateObject private var viewModel: NationViewModel = DependencyContainer.nationViewModel
    @State private var showingAlert: Bool = false
    @Environment(\.errorMessage) var errorMessage
    
    var body: some View {
        List {
            ForEach(viewModel.nationData) { element in
                HStack {
                    VStack(spacing: 3) {
                        Image(systemName: "calendar")
                        Text("\(element.year)")
                            .font(.title2)
                    }
                    Spacer()
                    HStack {
                        VStack(spacing: 3) {
                            Image(systemName: "person.3.fill")
                            Text("\(element.population)")
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getNationData()
        }
        .onReceive(viewModel.$hasError) { error in
            errorMessage.showingError = error
        }
    }
}
