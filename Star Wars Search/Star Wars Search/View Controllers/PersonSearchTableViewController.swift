//
//  PersonSearchTableViewController.swift
//  Star Wars Search
//
//  Created by Nelson Gonzalez on 5/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let personController = PersonController()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personController.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        
        let person = personController.people[indexPath.row]
        
        cell.person = person
        
        return cell
    }
    
}

extension PersonSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        personController.searchForPeople(with: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
}
