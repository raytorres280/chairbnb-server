//
//  ExploreVC.swift
//  fithub-swift
//
//  Created by Raymond Torres on 12/3/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation
import UIKit

class ExploreVC: UIViewController {
    
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBAction func onButtonPress(_ sender: Any) {
        print("hello world!")
    }
    @IBOutlet weak var chairList: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("listview loaded..")
        
        
        let newView = UIView()
        newView.backgroundColor = UIColor.blue
        
        chairList.addSubview(newView)
        
        guard let url = URL(string: "http://localhost:8080/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, err) in
            if let response = response {
                dump(response)
            }
            
            if let data = data {
                dump(data)
            }
            
            if let err = err {
                print(err)
            }
            
        }.resume()
        
    }
}
