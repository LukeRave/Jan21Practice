//
//  ViewController.swift
//  IsaacsScreens
//
//  Created by Isaac Farr on 1/21/22.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var FTemp: UITextView!
    @IBOutlet weak var CTemp: UILabel!
    
    @IBOutlet weak var TempReading: UIProgressView!
    @IBOutlet weak var indicatorImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FTemp.delegate = self;
    }
    func textViewDidChange(_ textView: UITextView){
        
        if let FAsInt = Int(FTemp.text) {
            let FtoCCalculation = ((FAsInt - 32) * 5 / 9)
            CTemp.text = String(FtoCCalculation)
            TempReading.progress = Float(CTemp.text!)! / 100.0
        }
        let CTempInt = Int(CTemp.text ?? "") ?? nil;
        if let CTempNum = CTempInt {
            
        if FTemp.text == "" {
            CTemp.text = "";
        }
        if CTempNum >= 30 {
            indicatorImage.image = UIImage(named: "fireImage")
        }
        else if CTempNum <= 5 {
            indicatorImage.image = UIImage(named: "iceImage")
        }
        else {
            indicatorImage.image = nil;
        }
    }
    }

}

