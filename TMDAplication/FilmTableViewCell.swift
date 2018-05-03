//
//  FilmTableViewCell.swift
//  TMDAplication
//
//  Created by Enric Pou Villanueva on 21/4/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {

    //MARK: -IBOutlets
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(film: Film) {
        titleLabel.text = film.title
        descriptionLabel.text = film.overview
    }

}
