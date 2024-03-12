//
//  ResultsViewModel.swift
//  DogApp
//
//  Created by Lucas Môra on 25/10/23.
//

import Foundation
import SwiftUI

struct Result {
    let name: String
    let picture: UIImage
}

class ResultsViewModel: ObservableObject {
    @Published var results = [(String, UIImage)]()
    
    func clearResults() {
        DispatchQueue.main.async {
            self.results = []
        }
    }
}
