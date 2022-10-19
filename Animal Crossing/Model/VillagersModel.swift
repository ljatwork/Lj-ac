//
//  VillagersModel.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation

struct VillagerElement: Codable {
    let name, id: String
    let imageURL, species: String
    let personality: Personality
    let gender: Gender
    
    enum CodingKeys: String, CodingKey {
        case name, id
        case imageURL = "image_url"
        case species, personality, gender
    }
}

struct VillagerValue: Codable {
    let name: String
    let id: String
    let imageURL, species: String
    let personality: Personality
    let gender: Gender
    let birthdayMonth: BirthdayMonth
    let birthdayDay: String
    let sign: Sign
    let quote, phrase, clothing: String
    let islander: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case id
        case imageURL = "image_url"
        case species, personality, gender
        case birthdayMonth = "birthday_month"
        case birthdayDay = "birthday_day"
        case sign, quote, phrase, clothing, islander
    }
}

enum Debut: String, Codable {
    case ac = "AC"
    case cf = "CF"
    case dnm = "DNM"
    case ePlus = "E_PLUS"
    case hhd = "HHD"
    case nh = "NH"
    case nl = "NL"
    case pc = "PC"
    case wa = "WA"
    case ww = "WW"
}

enum BirthdayMonth: String, Codable {
    case april = "April"
    case august = "August"
    case december = "December"
    case empty = ""
    case february = "February"
    case january = "January"
    case july = "July"
    case june = "June"
    case march = "March"
    case may = "May"
    case november = "November"
    case october = "October"
    case september = "September"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

enum Personality: String, Codable {
    case cranky = "Cranky"
    case jock = "Jock"
    case normal = "Normal"
    case peppy = "Peppy"
    case personalityLazy = "Lazy"
    case sisterly = "Sisterly"
    case smug = "Smug"
    case snooty = "Snooty"
}

enum Sign: String, Codable {
    case aquarius = "Aquarius"
    case aries = "Aries"
    case cancer = "Cancer"
    case capricorn = "Capricorn"
    case gemini = "Gemini"
    case leo = "Leo"
    case libra = "Libra"
    case pisces = "Pisces"
    case sagittarius = "Sagittarius"
    case scorpio = "Scorpio"
    case taurus = "Taurus"
    case virgo = "Virgo"
}

enum Species: String, CaseIterable {
    case Eagle
    case Anteater
    case Penguin
    case Bird
    case Bull
    case Mouse
    case Cat
    case Horse
    case Hamster
    case Kangaroo
    case Wolf
    case Chicken
    case Elephant
    case Lion
    case Sheep
    case Deer
    case Tiger
    case Cub
    case Dog
    case Bear
    case Cow
    case Hippo
    case Duck
    case Goat
    case Squirrel
    case Ostrich
    case Rabbit
    case Gorilla
    case Alligator
    case Pig
    case Frog
    case Koala
    case Monkey
}

typealias Villager = [VillagerElement]
typealias Villagers = [VillagerValue]
