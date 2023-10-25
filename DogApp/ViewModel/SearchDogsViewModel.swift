//
//  SearchDogsViewModel.swift
//  DogApp
//
//  Created by Lucas Môra on 24/10/23.
//

import Foundation
import SwiftUI

class SearchDogsViewModel {    
    func getNamesAndPictures(_ dogs: Dogs) -> [(String, UIImage)] {
        var names: [String] = []
        var picsUrls: [String] = []
        var pictures: [UIImage] = []
        
        dogs.forEach { dog in
            names.append(dog.name)
            picsUrls.append(dog.imageLink)
        }
        
        picsUrls.forEach { urlString in
            let url = URL(string: urlString)!
            
            var request = URLRequest(url: url)
            request.setValue("1ErqLZKNVaGqp5RB3FDmDg==YvopevCM37CeLoLu", forHTTPHeaderField: "X-Api-Key")
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else { return }
                
                let imagem = UIImage(data: data)
                pictures.append(imagem!)
            }
            task.resume()
        }
        
        var namesAndPictures = [(String, UIImage)]()
        for i in 0..<dogs.count {
            let dog = (dogs[i].name, pictures[i])
            namesAndPictures.append(dog)
        }
        return namesAndPictures
    }
    
    func search(params: [Double], completion: @escaping (Dogs?) -> Void) {
        let barking = Int(params[0])
        let energy = Int(params[1])
        let protectiveness = Int(params[2])
        let trainability = Int(params[3])
        
        let url = URL(string: "https://api.api-ninjas.com/v1/dogs?barking=\(barking)&energy=\(energy)&protectiveness=\(protectiveness)&trainability=\(trainability)")!
        
        var request = URLRequest(url: url)
        request.setValue("1ErqLZKNVaGqp5RB3FDmDg==YvopevCM37CeLoLu", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dados = try decoder.decode(Dogs.self, from: data)
                completion(dados)
            } catch {
                return
            }
            
        }
        task.resume()
    }
}
