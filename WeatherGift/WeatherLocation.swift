//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Joshua Chang  on 10/12/21.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getData() {
        let urlString = "Insert URL when API Key is fixed"
        
        print("We are processing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
    }
    
    // Create Session
    let session = URLSession.shared
    
    // get data with .dataTask Method
    let task = session.dataTask(with: url) { (data, response, error) in
        if let error = error {
        print("ERROR: \(error.localizedDescription)")
        }
        do {
            let json = JSONSerialization.jsonObject(with: data!, options: [])
            print("\(json)")
        } catch {
            print("JSON ERROR: \(error.localizedDescription)")
            
        }
    }
    task.resume()
    }
}


