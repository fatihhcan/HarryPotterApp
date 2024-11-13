// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characters = try? JSONDecoder().decode(Characters.self, from: jsonData)

import Foundation

// MARK: - Character
class Character: Codable {
    let id, name: String
    let alternateNames: [String]
    let species: String
    let gender: Gender
    let house: House
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool
    let ancestry: Ancestry
    let eyeColour: EyeColour
    let hairColour: HairColour
    let wand: Wand
    let patronus: Patronus
    let hogwartsStudent, hogwartsStaff: Bool
    let actor: String
    let alternateActors: [String]
    let alive: Bool
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case alternateNames = "alternate_names"
        case species, gender, house, dateOfBirth, yearOfBirth, wizard, ancestry, eyeColour, hairColour, wand, patronus, hogwartsStudent, hogwartsStaff, actor
        case alternateActors = "alternate_actors"
        case alive, image
    }

    init(id: String, name: String, alternateNames: [String], species: String, gender: Gender, house: House, dateOfBirth: String?, yearOfBirth: Int?, wizard: Bool, ancestry: Ancestry, eyeColour: EyeColour, hairColour: HairColour, wand: Wand, patronus: Patronus, hogwartsStudent: Bool, hogwartsStaff: Bool, actor: String, alternateActors: [String], alive: Bool, image: String) {
        self.id = id
        self.name = name
        self.alternateNames = alternateNames
        self.species = species
        self.gender = gender
        self.house = house
        self.dateOfBirth = dateOfBirth
        self.yearOfBirth = yearOfBirth
        self.wizard = wizard
        self.ancestry = ancestry
        self.eyeColour = eyeColour
        self.hairColour = hairColour
        self.wand = wand
        self.patronus = patronus
        self.hogwartsStudent = hogwartsStudent
        self.hogwartsStaff = hogwartsStaff
        self.actor = actor
        self.alternateActors = alternateActors
        self.alive = alive
        self.image = image
    }
}

enum Ancestry: String, Codable {
    case empty = ""
    case halfBlood = "half-blood"
    case halfVeela = "half-veela"
    case muggle = "muggle"
    case muggleborn = "muggleborn"
    case pureBlood = "pure-blood"
    case quarterVeela = "quarter-veela"
    case squib = "squib"
}

enum EyeColour: String, Codable {
    case amber = "amber"
    case beady = "beady"
    case black = "black"
    case blue = "blue"
    case brown = "brown"
    case dark = "dark"
    case empty = ""
    case green = "green"
    case grey = "grey"
    case hazel = "hazel"
    case orange = "orange"
    case paleSilvery = "pale, silvery"
    case scarlet = "Scarlet"
    case silver = "silver"
    case white = "white"
    case yellow = "yellow"
    case yellowish = "yellowish"
}

enum Gender: String, Codable {
    case empty = ""
    case female = "female"
    case male = "male"
}

enum HairColour: String, Codable {
    case bald = "bald"
    case black = "black"
    case blond = "blond"
    case blonde = "blonde"
    case brown = "brown"
    case dark = "dark"
    case dull = "dull"
    case empty = ""
    case ginger = "ginger"
    case green = "green"
    case grey = "grey"
    case purple = "purple"
    case red = "red"
    case sandy = "sandy"
    case silver = "silver"
    case tawny = "tawny"
    case white = "white"
}

enum House: String, Codable {
    case empty = ""
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

enum Patronus: String, Codable {
    case boar = "boar"
    case doe = "doe"
    case empty = ""
    case goat = "goat"
    case hare = "hare"
    case horse = "horse"
    case jackRussellTerrier = "Jack Russell terrier"
    case lynx = "lynx"
    case nonCorporeal = "Non-Corporeal"
    case otter = "otter"
    case persianCat = "persian cat"
    case phoenix = "Phoenix"
    case stag = "stag"
    case swan = "swan"
    case tabbyCat = "tabby cat"
    case weasel = "weasel"
    case wolf = "wolf"
}

// MARK: - Wand
class Wand: Codable {
    let wood: String
    let core: Core
    let length: Double?

    init(wood: String, core: Core, length: Double?) {
        self.wood = wood
        self.core = core
        self.length = length
    }
}

enum Core: String, Codable {
    case dragonHeartstring = "dragon heartstring"
    case empty = ""
    case phoenixFeather = "phoenix feather"
    case phoenixTailFeather = "phoenix tail feather"
    case unicornHair = "unicorn hair"
    case unicornTailHair = "unicorn tail hair"
}

typealias Characters = [Character]
