//
//  PersonTableViewCell.swift
//  Star Wars Search
//
//  Created by Nelson Gonzalez on 5/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!

    // MARK: - Properties
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Private Functions
    
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        genderLabel.text = "Gender: \(person.gender)"
        birthYearLabel.text = "Birth year: \(person.birthYear)"
    }
    
    

}
