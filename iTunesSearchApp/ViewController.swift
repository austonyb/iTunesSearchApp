//
//  ViewController.swift
//  iTunesSearchApp
//
//  Created by Auston Youngblood on 12/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func searchedPressed(_ sender: Any) {
        guard let term = searchTextField.text else { return }
        
        SearchResultsController.searchResultsforSearchTerm(searchTerm: term) { [weak self] (results) in
                if let searchResults = results,
                   let firstResult = searchResults.first {
                    DispatchQueue.main.async {
                        self?.resultsLabel.text = "\(firstResult.trackName) - \(firstResult.artistName)"
                    }
                }
        }
    }
}

