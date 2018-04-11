//
//  ViewController.swift
//  TMDAplication
//
//  Created by Enric Pou Villanueva on 10/4/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //MARK: - Constants
    let URL_TMDB = "https://api.themoviedb.org/3/movie/popular?api_key=93aea0c77bc168d8bbce3918cefefa45&language=en-US&page=1"

    //MARK: - Overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireRequest()
        
    }

    func alamofireRequest() {
        
        let request = Alamofire.request(URL_TMDB).responseJSON { (response) in
            debugPrint(response)
        }
    }

}

