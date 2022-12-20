//
//  SearchResults.swift
//  iTunesSearchApp
//
//  Created by Auston Youngblood on 12/20/22.
//

import Foundation

class SearchResults {
    var artistName = ""
    var trackName = ""
    var itemDescription = ""
    var trackPrice = 0.0
    
    init?(json: [String: AnyObject]) {
        guard let artistName = json["artistName"] as? String,
              let trackName = json["trackName"] as?
                String else { return nil }
        
        let itemDescription = json["description"]
        let price = json["trackPrice"]
        
        self.artistName = artistName
        self.trackName = trackName
        
        if let trackP = price as? Double {
            self.trackPrice = trackP
        }
        if let d = itemDescription as? String {
            self.itemDescription = d
        }
    }
}
