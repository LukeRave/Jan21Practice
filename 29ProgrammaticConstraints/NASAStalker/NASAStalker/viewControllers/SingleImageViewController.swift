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
    let viewEdgeBoundary: CGFloat = 5
    lazy var roverImagePicture: UIImageView = UIImageView()
    lazy var roverSelfDescription: UILabel = UILabel()
    lazy var roverCameraDescription: UILabel = UILabel()
    lazy var roverImageDescription: UILabel = UILabel()
    lazy var roverIsFavoriteLabel: UILabel = UILabel()
    lazy var roverIsFavoriteSwitch: UISwitch = UISwitch()
    override func viewDidLoad() {
        super.viewDidLoad()
        let myviews: [UIView] = [roverImagePicture, roverSelfDescription, roverCameraDescription, roverImageDescription, roverIsFavoriteSwitch, roverIsFavoriteLabel]
        myviews.forEach { view.addSubview($0) }
        initRoverImagePicture()
        initRoverIsFavorite()
        initDescriptionLabels()
    }
    private func initDescriptionLabels() {
        roverImageDescription.translatesAutoresizingMaskIntoConstraints = false
        roverCameraDescription.translatesAutoresizingMaskIntoConstraints = false
        roverSelfDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roverImageDescription.bottomAnchor.constraint(equalTo: roverIsFavoriteLabel.topAnchor, constant: (-1 * viewEdgeBoundary)),
            roverImageDescription.leadingAnchor.constraint(equalTo: roverImagePicture.leadingAnchor),
            roverImageDescription.trailingAnchor.constraint(equalTo: roverImagePicture.trailingAnchor),
            roverImageDescription.heightAnchor.constraint(equalTo: roverIsFavoriteLabel.heightAnchor),
            roverCameraDescription.bottomAnchor.constraint(equalTo: roverImageDescription.topAnchor, constant: (-1 * viewEdgeBoundary)),
            roverCameraDescription.leadingAnchor.constraint(equalTo: roverImagePicture.leadingAnchor),
            roverCameraDescription.trailingAnchor.constraint(equalTo: roverImagePicture.trailingAnchor),
            roverCameraDescription.heightAnchor.constraint(equalTo: roverIsFavoriteLabel.heightAnchor),
            roverSelfDescription.bottomAnchor.constraint(equalTo: roverCameraDescription.topAnchor, constant: (-1 * viewEdgeBoundary)),
            roverSelfDescription.leadingAnchor.constraint(equalTo: roverImagePicture.leadingAnchor),
            roverSelfDescription.trailingAnchor.constraint(equalTo: roverImagePicture.trailingAnchor),
            roverSelfDescription.heightAnchor.constraint(equalTo: roverIsFavoriteLabel.heightAnchor)
        ])
        roverImageDescription.text = "ROVER: \(model?.rover?.name ?? "") -- \(model?.rover?.id ?? 0)"
        roverCameraDescription.text = "CAMERA: \(model?.camera?.full_name ?? "")"
        roverSelfDescription.text = "IMAGE: \(model?.earth_date ?? "") -- \(model?.id ?? 0)"
        
    }
    private func initRoverImagePicture() {
        roverImagePicture.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roverImagePicture.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: (-1 * viewEdgeBoundary)),
            roverImagePicture.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: viewEdgeBoundary),
            roverImagePicture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: (-1 * viewEdgeBoundary)),
            roverImagePicture.heightAnchor.constraint(equalTo: roverImagePicture.widthAnchor)
        ])
        roverImagePicture.image = NASAImage
    }
    private func initRoverIsFavorite() {
        let isFavorite = model?.isFavorite ?? false
        roverIsFavoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        roverIsFavoriteSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roverIsFavoriteSwitch.bottomAnchor.constraint(equalTo: roverImagePicture.topAnchor, constant: (-1 * viewEdgeBoundary)),
            roverIsFavoriteSwitch.trailingAnchor.constraint(equalTo: roverImagePicture.trailingAnchor),
            roverIsFavoriteLabel.leadingAnchor.constraint(equalTo: roverImagePicture.leadingAnchor),
            roverIsFavoriteLabel.bottomAnchor.constraint(equalTo: roverIsFavoriteSwitch.bottomAnchor),
            roverIsFavoriteLabel.trailingAnchor.constraint(equalTo: roverIsFavoriteSwitch.leadingAnchor, constant: (-1 * viewEdgeBoundary)),
            roverIsFavoriteLabel.topAnchor.constraint(equalTo: roverIsFavoriteSwitch.topAnchor)
        ])
        roverIsFavoriteLabel.text = "Favorite this picture?"
        roverIsFavoriteLabel.textAlignment = .right
        roverIsFavoriteSwitch.setOn(isFavorite, animated: false)
        roverIsFavoriteSwitch.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
    }
    @objc func toggleSwitch() {
        guard let modelIndex = modelIndex else { return }
        delegate?.changedIsFavorite(modelIndex: modelIndex)
    }
}
