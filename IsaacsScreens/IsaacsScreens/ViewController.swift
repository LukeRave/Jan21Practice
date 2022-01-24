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
        FTemp.centerVerticalText()
        
    }
    func textViewDidChange(_ textView: UITextView){
        FTemp.centerVerticalText()
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
extension UITextView {

    func centerVerticalText() {
        self.textAlignment = .center
        let fitSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fitSize)
        let calculate = (bounds.size.height - size.height * zoomScale) / 2
        let offset = max(1, calculate)
        contentOffset.y = -offset
    }
}
