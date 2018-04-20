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
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=93aea0c77bc168d8bbce3918cefefa45&language=en-US&page=1")
    
    //MARK: - Variables
    var films = [Films]()

    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireRequest()
    }

    func alamofireRequest() {
        
        if let secureUrl = url {
            
            Alamofire.request(secureUrl).responseJSON { [weak self] response in
                
                if let dataResponse = response.data {
                    
                    do {
                        guard let `self` = self else {
                            return
                        }
                        self.films = try [JSONDecoder().decode(Films.self, from: dataResponse)]
                        print (self.films)
                    }catch {
                        print("error")
                    }
                }
            }
        }
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

