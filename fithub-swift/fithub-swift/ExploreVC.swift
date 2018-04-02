//
//  ExploreVC.swift
//  fithub-swift
//
//  Created by Raymond Torres on 12/3/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation
import UIKit

class ExploreVC: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBAction func onButtonPress(_ sender: Any) {
        print("hello world!")
    }
    @IBOutlet weak var logCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("listview loaded..")
        
        logCollection.dataSource = self
        
        let newView = UIView()
        newView.backgroundColor = UIColor.blue
        
        guard let url = URL(string: "http://localhost:8080/users") else { return }
        
        apollo.fetch(query: LogsByUserIdQuery(id: "cjfhzy3j500630131ccrr3t8y")) { (result, err) in
            print("came back from first swift query!")
            print(result)
        }
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, response, err) in
//            if let response = response {
//                dump(response)
//            }
//
//            if let data = data {
//                dump(data)
//            }
//
//            if let err = err {
//                print(err)
//            }
//
//        }.resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = logCollection.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
        cell.logLabel.text = "hello world"
        return cell
    }
}
