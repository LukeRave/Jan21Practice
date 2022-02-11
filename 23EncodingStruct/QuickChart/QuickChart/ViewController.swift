//
//  ViewController.swift
//  QuickChart
//
//  Created by Rave Bizz on 2/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chartImage: UIImageView!
    
    
    var comp = URLComponents()
    let chart = Chart(type: "bar", data: DataObj(labels: [2012,2013,2014,2015,2016], datasets: [DataSet(label: "Users", data: [120,60,50,180,1200])]))
    let encoder = JSONEncoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        getChart(chart: chart)
    }
    
    func getChart(chart: Chart){
        comp.scheme = "https"
        comp.host = "quickchart.io"
        comp.path = "/chart"
        
        do{
            let chartData = try encoder.encode(chart)
            let json = String(data: chartData, encoding: String.Encoding.utf8)
            let query = URLQueryItem(name: "c", value: json)
            comp.queryItems = [query]
            //            print(comp.url)
            if let url = comp.url {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.chartImage.image = UIImage(data: data)
                    }
                }.resume()
            }
        }catch{
            print(error)
        }
    }
    
}
