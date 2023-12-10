//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Anqi Guan on 12/9/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cityCodes = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityCodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cityCodes[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getWeatherValues(_ sender: Any) {
        let url = "https://us-central1-fir-api-s-8d31b.cloudfunctions.net/app"
        AF.request(url).responseJSON { response in
            if(response.error != nil){
                print(response.error?.localizedDescription as Any)
                return
            }
            // We have valid data here
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
//            guard let weather = jsonArray.first else {return}
            self.cityCodes = [String]()
            for weather in jsonArray{
                let cityCode = weather["cityCode"].stringValue
                let city = weather["city"].stringValue
                let temperature = weather["temperature"].stringValue
                let conditions = weather["conditions"].stringValue
                print(cityCode)
                print(city)
                print(temperature)
                print(conditions)
                self.cityCodes.append("\(city): \(temperature), \(conditions)")
                
            }
            self.tblView.reloadData()

        }
        
    }
}
