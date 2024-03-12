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
        
        let results: [Result] = resultsViewModel.getResults().map { tuple in
            Result(name: tuple.0, picture: tuple.1)
        }
        
        if !results.isEmpty {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(results, id: \.self) { result in
                        createGridItem(name: result.name, picture: result.picture)
                    }
                }
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
