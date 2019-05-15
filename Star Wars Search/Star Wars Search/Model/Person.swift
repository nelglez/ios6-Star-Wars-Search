//
//  Person.swift
//  Star Wars Search
//
//  Created by Nelson Gonzalez on 5/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
//Codable is two protocols. Decodable takes care of decoding data into a model object, Codable is the opposit, where you take a model object and conver it to data.
struct Person: Codable {
    
    let name: String
    let gender: String
    let birthYear: String
    
    //Enums allows us to limit the choices we have for something (in a good way)
    enum CodingKeys: String, CodingKey {
        //we want the decoder to look for a different key than the name of our properties.
        case name
        case gender
        case birthYear = "birth_year" //different raw value
    }
    
}

struct PersonSearch: Codable {
    //Which key-value pair do we care about?
    let results: [Person]
}

/*
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
    {
    "name": "R2-D2",
    "height": "96",
    "mass": "32",
    "hair_color": "n/a",
    "skin_color": "white, blue",
    "eye_color": "red",
    "birth_year": "33BBY",
    "gender": "n/a",
    "homeworld": "https://swapi.co/api/planets/8/",
    "films": [
    "https://swapi.co/api/films/2/",
    "https://swapi.co/api/films/5/",
    "https://swapi.co/api/films/4/",
    "https://swapi.co/api/films/6/",
    "https://swapi.co/api/films/3/",
    "https://swapi.co/api/films/1/",
    "https://swapi.co/api/films/7/"
    ],
    "species": [
    "https://swapi.co/api/species/2/"
    ],
    "vehicles": [],
    "starships": [],
    "created": "2014-12-10T15:11:50.376000Z",
    "edited": "2014-12-20T21:17:50.311000Z",
    "url": "https://swapi.co/api/people/3/"
    }
    ]
}
*/
