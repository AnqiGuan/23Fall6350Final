//
//  ViewController.swift
//  SeattleImages
//
//  Created by Anqi Guan on 12/9/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let imageNumber = ["1", "2", "3", "4", "5", "6", "7", "8","9", "10"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   Bundle.main.loadNibNamed("SeattleTableViewCell", owner: self)?.first as! SeattleTableViewCell
        cell.imageView?.image = UIImage(named: "Seattle\(indexPath.row)")
        cell.lblSeattle.text = imageNumber[indexPath.row]
        return cell
    }

}

