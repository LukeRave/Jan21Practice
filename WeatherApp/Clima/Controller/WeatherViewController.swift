//
//  ViewController.swift
//  Clima
//
//  Created by Isaac Farr on 01/27/2022.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit



class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self;
        searchTextField.delegate = self;
        weatherManager.fetchWeather(cityName: "Maryville", stateName: "TN")
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Type something";
            return false;
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let location = searchTextField.text ?? "Philadelphia PA"
        var locationAsArray: [String.SubSequence] = [];
        var state: String? = nil;
        var city: String;
        
        if location.contains(","){
            let noWhiteSpace = location.filter{!$0.isWhitespace}
            locationAsArray = noWhiteSpace.split(separator: ",")
            city = String(locationAsArray[0])
            let stateAsString = String(locationAsArray[1]);
            state = weatherManager.convertStateToAbbrev(nonOptStateName: stateAsString)
        }
        else {
            city = location;
        }
        weatherManager.fetchWeather(cityName: city, stateName: state)
        
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.formattedTemp;
            self.searchTextField.text = ""
            self.searchTextField.placeholder = "Enter 'City' or 'City,State'"
            self.cityLabel.text = weather.cityName;
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
