//
//  Dog.swift
//  DogApp
//
//  Created by Lucas Môra on 24/10/23.
//

import Foundation

struct DogElement: Codable {
    let imageLink: String
    let goodWithChildren, goodWithOtherDogs, shedding, grooming: Int
    let drooling, coatLength, goodWithStrangers, playfulness: Int
    let protectiveness, trainability, energy, barking: Int
    let minLifeExpectancy, maxLifeExpectancy: Int
    let maxHeightMale, maxHeightFemale, maxWeightMale, maxWeightFemale: Double
    let minHeightMale, minHeightFemale, minWeightMale, minWeightFemale: Double
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case imageLink = "image_link"
        case goodWithChildren = "good_with_children"
        case goodWithOtherDogs = "good_with_other_dogs"
        case shedding, grooming, drooling
        case coatLength = "coat_length"
        case goodWithStrangers = "good_with_strangers"
        case playfulness, protectiveness, trainability, energy, barking
        case minLifeExpectancy = "min_life_expectancy"
        case maxLifeExpectancy = "max_life_expectancy"
        case maxHeightMale = "max_height_male"
        case maxHeightFemale = "max_height_female"
        case maxWeightMale = "max_weight_male"
        case maxWeightFemale = "max_weight_female"
        case minHeightMale = "min_height_male"
        case minHeightFemale = "min_height_female"
        case minWeightMale = "min_weight_male"
        case minWeightFemale = "min_weight_female"
        case name
    }
}

typealias Dogs = [DogElement]
