//
//  FilterViewController.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import UIKit

class FilterViewController: UIViewController {

    static var isFromHome = false
    
    let viewModel = FilterViewModel()

    @IBAction func submitButton(_ sender: Any) {
        viewModel.searchByTag(params: queryParams, completion: {
            //TODO: present
            self.presentResults()
        })
    }
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var brandButton: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var brandsPicker: UIPickerView!
    @IBOutlet weak var typesPicker: UIPickerView!
    @IBOutlet weak var tagsPicker: UIPickerView!
    
    var queryParams:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configerPicker()
        configureButtons()
        hideLabels()
    }
    
    func configureButtons(){
        let buttons = [tagButton, brandButton, typeButton]
        for button in buttons{
            button?.isHidden = true
            button?.addTarget(self, action:#selector(handleAction(button:)), for: .touchUpInside)
        }
    }
    
    func hideLabels(){
        tagLabel.isHidden = true
        brandLabel.isHidden = true
        typeLabel.isHidden = true
    }
    
    @objc func handleAction(button: UIButton){
        switch button.tag{
        case 0:
            typeLabel.isHidden = true
            button.isHidden = true
            queryParams.remove(at: queryParams.firstIndex(of: typeLabel.text!) ?? 0)
          
        case 1:
            brandLabel.isHidden = true
            button.isHidden = true
            queryParams.remove(at: queryParams.firstIndex(of: brandLabel.text!) ?? 0)
        case 2:
           tagLabel.isHidden = true
            button.isHidden = true
            queryParams.remove(at: queryParams.firstIndex(of: tagLabel.text!) ?? 0)
        default:
            return
        }
    }
    func presentResults(){
        let storyBoard = UIStoryboard(name: StringConstants.recentSBName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: StringConstants.recentSBID.rawValue) as! ProductsViewController
        vc.isFromHome = FilterViewController.isFromHome
        vc.viewModel = ProductsViewModel()
        vc.viewModel?.makeupModel = self.viewModel.makeupModel
        vc.titleText = StringConstants.searchResults.rawValue
        self.present(vc, animated: true, completion: nil)
    }
    func configerPicker(){
        brandsPicker.delegate = self
        brandsPicker.delegate = self
        typesPicker.delegate = self
        typesPicker.dataSource = self
        tagsPicker.dataSource = self
        tagsPicker.delegate = self
    }

}
