//
//  ResultsView.swift
//  DogApp
//
//  Created by Lucas Môra on 25/10/23.
//

import SwiftUI

struct ResultsView: View {
    @State private var isSecondViewPresented = false
    
    var body: some View {
        let layout = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        LazyVGrid(columns: layout, content: {
            createGridItem(picture: "heart.fill", name: "Golden Retriever")
            createGridItem(picture: "heart.fill", name: "Border Collie")
        })
    }
    
    public func createGridItem(picture: String, name: String) -> some View {
        return VStack {
            Image(systemName: picture)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fill)
            
            Divider()
            Text(name)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
