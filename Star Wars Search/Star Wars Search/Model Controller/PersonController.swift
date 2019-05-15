//
//  PersonController.swift
//  Star Wars Search
//
//  Created by Nelson Gonzalez on 5/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class PersonController {
    
    enum HTTPMethods: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    private(set) var people: [Person] = []
    
    //Grab the base URL
    
    let baseUrl = URL(string: "https://swapi.co/api/")!
    //failable init can fail, if it could not be what is required.
    
    //CRUD
    //Reading from swapi API
    
    func searchForPeople(with searchTerm: String, completion: @escaping () -> Void) {
        //Set up the URL to go to the right place in the api.
        
        let peopleUrl = baseUrl.appendingPathComponent("people")
        //https://swapi.co/api/people
        var urlComponents = URLComponents(url: peopleUrl, resolvingAgainstBaseURL: true)
        
        let searchQueryItem = URLQueryItem(name: "search", value: searchTerm)
        
        urlComponents?.queryItems = [searchQueryItem]
        //https://swapi.co/api/people?search=searchTermHere
        
        //We ask the urlComponents for a fully formattewd url using the peopleURL that we gave it in the initializer and adding the query paramenters onto it
        guard let formattedUrl = urlComponents?.url else {
            completion()
            return
        }
        //We need to create a request
        
        var request = URLRequest(url: formattedUrl)
        //-url
        //http method
        request.httpMethod = HTTPMethods.get.rawValue
        //- (optinonally) the information to send to the url
        
        
        //Perform the request (go to the API)
        //class that allows you to do networking
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            //Are there ay errors from the API
            if let error = error {
                NSLog("Error searching for people :\(error)")
                completion()
                return
            }
           //Make sure that we got (JSON) data back
            guard let data = data else {
                NSLog("No data returned from data task")
                completion()
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
               let personSearch = try decoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
                //We have put the new people in the array, you can reload the table view or whatever else.
                completion()
                
                //catch statements have their own error. You can override that name " } catch let decodingError {"
            } catch {
                NSLog("Error decoding PersonSearch from data: \(error)")
                completion()
            }
            }.resume() // This kicks off the network call
    }
}
