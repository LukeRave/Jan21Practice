//
//  ViewController.swift
//  EncodingStruct
//
//  Created by ravebizz on 2/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chartImage: UIImageView!
    var components = URLComponents()
    override func viewDidLoad() {
        super.viewDidLoad()
        components.scheme = "https"
        components.host = "quickchart.io"
        components.path = "/chart"
        let chart = Chart(type: "bar", data: DataClass(labels: [2012,2013,2014,2015,2016], datasets: [Dataset(label:"Users", data: [120,60,50,180,120])]))
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(chart)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            components.queryItems = [
                    URLQueryItem(name: "c", value: json)
                ]
            if let url = components.url {
                URLSession.shared.dataTask(with: url) { d, r, e in
                    guard let data = d else {
                        print("error getting data")
                        return
                    }
                    DispatchQueue.main.async {
                        self.chartImage.image = UIImage(data: data)
                    }
                }.resume()
            }
        } catch {
            print(error)
        }
        
    }
    //https://quickchart.io/chart?c={type:'bar',data:{labels:[2012,2013,2014,2015,2016],datasets:[{label:'Users',data:[120,60,50,180,1200]}]}}}
}
