//
//  SearchResultsController.swift
//  iTunesSearchApp
//
//  Created by Auston Youngblood on 12/20/22.
//

import Foundation

class SearchResultsController {
    static func searchResultsforSearchTerm(searchTerm: String, completion: @escaping (_ results: [SearchResults]?) -> Void) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        fetchJSONAtURL(url: url) { (json) in
            guard let j = json,
                  let allResults = j["results"] as? [[String: AnyObject]] else { return }
            let searchResults = allResults.flatMap({ return SearchResults(json: $0)})
            completion(searchResults)
        }
    }
    
    static func fetchJSONAtURL(url: URL, completion: @escaping (_ json: [String: AnyObject]?) -> Void) {
        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error {
                print("error downloading data \(e)")
            } else if let d = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: d, options: []) as? [String : AnyObject] {
                        completion(json)
                    }
                } catch let jsonError {
                    print("error decoding JSON \(jsonError)")
                }
            }
        }
        task.resume()
    }
}
