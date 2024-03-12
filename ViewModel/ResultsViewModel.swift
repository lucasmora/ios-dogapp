//
//  ResultsViewModel.swift
//  DogApp
//
//  Created by Lucas Môra on 25/10/23.
//

import Foundation
import SwiftUI

class ResultsViewModel: ObservableObject {
    @Published var results = [(String, UIImage)]()
    
    func getResults() -> [(String, UIImage)] {
        return self.results
    }
    
    func clearResults() {
        DispatchQueue.main.async {
            self.results = []
        }
    }
}
