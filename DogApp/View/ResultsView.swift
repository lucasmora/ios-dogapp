//
//  ResultsView.swift
//  DogApp
//
//  Created by Lucas Môra on 25/10/23.
//

import SwiftUI

struct ResultsView: View {
    @ObservedObject var resultsViewModel: ResultsViewModel
    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        if !resultsViewModel.results.isEmpty {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    createGridItem(name: $resultsViewModel.results[0].0.wrappedValue, picture: $resultsViewModel.results[0].1.wrappedValue) }
            }
        } else {
            Text("Loading...")
        }
    }
    
    public func createGridItem(name: String, picture: UIImage) -> some View {
        return VStack {
            Image(uiImage: picture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .clipped()
            
            Divider()
            Text(name)
        }
    }
    
    struct ResultsView_Previews: PreviewProvider {
        static var previews: some View {
            ResultsView(resultsViewModel: ResultsViewModel())
        }
    }
}
