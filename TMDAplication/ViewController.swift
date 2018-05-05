//
//  ViewController.swift
//  TMDAplication
//
//  Created by Enric Pou Villanueva on 10/4/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit
import Alamofire

struct Film: Decodable {
    let title: String
    let overview: String
}

struct Films: Decodable {
    let results: [Film]
}

class ViewController: UIViewController {
    
    //MARK: - Constants
    let CELL_IDENTIFIER = "filmCellIdentifier"
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=93aea0c77bc168d8bbce3918cefefa45&language=en-US&page=1")
    let ESTIMATED_ROW_HEIGHT = 100.0
    
    //MARK: - Variables
    var films = [Films]()
    var arrayOfFilms = [Film]()
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        alamofireRequest()
    }

    //MARK: - Public methods
    public func configureUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK: - Private methods
    func alamofireRequest() {
        
        if let secureUrl = url {
            
            Alamofire.request(secureUrl).responseJSON { [weak self] response in
                
                if let dataResponse = response.data {
                    
                    do {
                        guard let `self` = self else {
                            return
                        }
                        self.films = try [JSONDecoder().decode(Films.self, from: dataResponse)]
                        
                        for listOfFilms in self.films {
                            for eachFilm in listOfFilms.results {
                                self.arrayOfFilms = listOfFilms.results
                                print(eachFilm.title, ":", eachFilm.overview, "\n")
                            }
                        }
                        self.tableView.reloadData()
                    }catch {
                        print("error")
                    }
                }
            }
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        
        
        if let newCell = cell as? FilmTableViewCell {
            newCell.bind(film: arrayOfFilms[indexPath.row])
            cell = newCell
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = CGFloat(ESTIMATED_ROW_HEIGHT)
        return tableView.rowHeight
    }
}

//This is other example to show different countries

//struct Country: Decodable {
//    let name: String
//    let capital: String
//}
//
//let url = URL(string: "https://restcountries.eu/rest/v2/all")
//
//var countries = [Country]()
//
//self.countries = try JSONDecoder().decode([Country].self, from: dataResponse)
//for country in self.countries {
//    print(country)
//}

