//
//  WeatherDetail.swift
//  WeatherGift
//
//  Created by Joshua Chang  on 10/12/21.
//

import Foundation
class WeatherDetail: WeatherLocation {
    
    struct Result: Codable {
        var timezone: String
        var current: Current
    }
    struct Current: Codable {
        var dt: TimeInterval
        var temp: Double
        var weather: [Weather]
    }
    struct Weather: Codable {
        var description: String
        var icon: String
    }
    
    var timezone = ""
    var currentTime = 0.0
    var temperature = 0
    var summary = ""
    var dailyIcon = ""
    
    func getData(completed: @escaping() -> ()) {
        let urlString = "Insert URL when API Key is fixed"
        
        print("We are processing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        // Create Session
        let session = URLSession.shared
            
        // get data with .dataTask Method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
            print("ERROR: \(error.localizedDescription)")
            }
            do {
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timezone = result.timezone
                self.currentTime = result.current.dt
                self.temperature = Int(result.current.temp.rounded())
                self.summary = result.current.weather[0].description
                self.dailyIcon = result.current.weather[0].icon
                
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
                    
            }
            completed()
    }
        task.resume()
}
}