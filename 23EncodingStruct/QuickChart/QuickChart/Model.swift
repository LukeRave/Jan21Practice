//
//  Model.swift
//  QuickChart
//
//  Created by Rave Bizz on 2/9/22.
//

import Foundation

struct Chart: Encodable {
    let type: String
    let data: DataObj
}

struct DataObj: Encodable{
    let labels: [Int]
    let datasets: [DataSet]
}

struct DataSet: Encodable {
    let label: String
    let data: [Int]
}

//https://quickchart.io/chart?c={type:'line',data:{labels:[2012,2013,2014,2015,2016],datasets:[{label:'Users',data:[120,60,50,180,1200]}]}}
