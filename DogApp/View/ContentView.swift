//
//  ContentView.swift
//  DogApp
//
//  Created by Lucas Môra on 24/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var barkingValue: Double = 4.0
    @State private var energyValue: Double = 5.0
    @State private var protectivenessValue: Double = 3.0
    @State private var trainabilityValue: Double = 5.0
    
    private let searchViewModel: SearchDogsViewModel = SearchDogsViewModel()
    @ObservedObject var resultsViewModel = ResultsViewModel()
    @State private var noResultsFound: Bool = false
    
    @State private var namesAndPics: [Any] = []
    @State private var showResultsPage: Bool = false
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        if noResultsFound {
            showNoResultsOverlay()
        } else {
            NavigationView {
                VStack {
                    NavigationLink(destination: ResultsView(resultsViewModel: resultsViewModel), isActive: self.$showResultsPage) {
                        EmptyView()
                    }.hidden()
                    // CABEÇALHO
                    VStack {
                        Text("Dog searcher")
                            .font(.title)
                            .padding(.all, 10.0)
                        
                        Text("Find your perfect companion!")
                            .font(.subheadline)
                            .padding(.horizontal)
                    }
                    .padding()
                    
                    Divider()
                    
                    // CONTEÚDO
                    ScrollView {
                        VStack {
                            createSlider(label: "Barking", value: $barkingValue)
                            createSlider(label: "Energy", value: $energyValue)
                            createSlider(label: "Protectiveness", value: $protectivenessValue)
                            createSlider(label: "Trainability", value: $trainabilityValue)
                        }
                        .padding(.bottom, 10)
                        
                        Button(action: searchAction, label: {
                            Text("Search")
                                .padding(.horizontal, 30.0)
                                .padding(.vertical, 20.0)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(12.0)
                        })
                        .padding(.bottom, 20.0)
                    }
                }.navigationBarHidden(true)
            }
        }
    }
    
    private func createSlider(label: String, value: Binding<Double>) -> some View {
        return VStack {
            HStack {
                Text(label)
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 16.0)
                Spacer()
                Text("\(value.wrappedValue, specifier: "%.0f")")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.2, green: 0.23, blue: 0.3))
                    .padding(.horizontal)
            }
            
            HStack {
                Text("How much your dog would bark.")
                    .font(.caption)
                    .foregroundColor(Color(red: 0.41, green: 0.42, blue: 0.47))
                    .padding(.horizontal)
                Spacer()
            }
            .padding(.top, 1.0)
            
            Slider(value: value,
                   in: 1...5,
                   step: 1)
                .padding()
            
            Divider()
        }
    }
    
    private func searchAction() {
        let searchParams = [barkingValue, energyValue, protectivenessValue, trainabilityValue]
        searchViewModel.search(params: searchParams) { dogs in
            guard let dogs = dogs else { return }
            if dogs.isEmpty {
                noResultsFound.toggle()
            } else {
                resultsViewModel.clearResults()
                showResultsPage = true
                let _ = searchViewModel.getNamesAndPictures(dogs) { names in
                    DispatchQueue.main.async {
                        resultsViewModel.results = names
                    }
                }
            }
        }
    }
    
    private func showNoResultsOverlay() -> some View {
        return ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            Text("No dogs found =(")
        }
        .onTapGesture {
            noResultsFound.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
