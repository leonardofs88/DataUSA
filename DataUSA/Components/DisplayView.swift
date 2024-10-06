//
//  DisplayView.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import SwiftUI
import Foundation

struct DisplayView: View {

    @Binding var currentSelection: MeasureType
    @Environment(\.errorMessage) var errorMessage: ErrorMessage
    
    var body: some View {
        switch currentSelection {
        case .nation:
            NationListView()
                .environment(\.errorMessage, errorMessage)
        case .state:
            StateListView()
                .environment(\.errorMessage, errorMessage)
        }
    }
}
