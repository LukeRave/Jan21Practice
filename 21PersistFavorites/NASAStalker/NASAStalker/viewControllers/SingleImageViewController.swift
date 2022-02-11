//
//  SingleImageViewController.swift
//  NASAStalker
//
//  Created by Rave Training on 2/9/22.
//

import UIKit
protocol ChangedFavorite {
    func changedIsFavorite(modelIndex: Int)
}
class SingleImageViewController: UIViewController {
    var model: RoverImageModel?
    var delegate: ChangedFavorite?
    var modelIndex: Int?
    var NASAImage: UIImage?
    @IBOutlet weak var SingleImageSwitch: UISwitch!
    @IBOutlet weak var SingleImageDescription: UILabel!
    @IBOutlet weak var SingleImageImageView: UIImageView!
    @IBAction func SingleImageSwitch(_ sender: Any) {
        guard let modelIndex = modelIndex else { return }
        delegate?.changedIsFavorite(modelIndex: modelIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let isFavorite = model?.isFavorite ?? false
        self.SingleImageSwitch.setOn(isFavorite, animated: false)
        self.SingleImageDescription.text = """
ROVER: \(model?.rover?.name ?? "") -- \(model?.rover?.id ?? 0)

CAMERA: \(model?.camera?.full_name ?? "")

IMAGE: \(model?.earth_date ?? "") -- \(model?.id ?? 0)
"""
        self.SingleImageImageView.image = NASAImage
    }
}
