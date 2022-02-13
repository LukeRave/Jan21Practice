//
//  DetailsViewController.swift
//  Project_29
//
//  Created by Rave Bizz on 2/13/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    static let identifier = String(describing: DetailsViewController.self)
    
    let albumView = UIImageView()
    let scrollView = UIScrollView(),
        albumName: UILabel = {
            let label = UILabel()
            label.text = "Album Label"
            return label
        }(),
artistName: UILabel = {
    let label = UILabel()
    label.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
    label.text = "Artist Label"
    return label
}(),
genreName: UILabel = {
    let label = UILabel()
    label.text = "Genre"
    return label
}(),
releaseDate: UILabel = {
    let label = UILabel()
    label.text = "Release Date"
    return label
}(),
iTunesButton: UIButton = {
    let button = UIButton()
    button.setTitle("iTunes", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.tintColor = .black
    button.backgroundColor = .lightGray
    return button
}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(albumView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(artistName)
        scrollView.addSubview(albumName)
        scrollView.addSubview(genreName)
        scrollView.addSubview(releaseDate)
        scrollView.addSubview(iTunesButton)
        
        
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    func setUpConstraints(){
        imageConstraint()
        scrollViewConstraint()
        artistNameConstraint()
        albumNameConstraint()
        genreConstraint()
        dateConstraint()
        buttonConstraint()
    }
    func imageConstraint(){
        albumView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumView.widthAnchor.constraint(equalTo: view.widthAnchor),
            albumView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            albumView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    func scrollViewConstraint(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: albumView.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func artistNameConstraint(){
        artistName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            artistName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            artistName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            artistName.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            artistName.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
    }
    func albumNameConstraint(){
        albumName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            albumName.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 20),
            albumName.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            albumName.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    func genreConstraint(){
        genreName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            genreName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 10),
            genreName.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            genreName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    func dateConstraint(){
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            releaseDate.topAnchor.constraint(equalTo: genreName.bottomAnchor, constant: 10),
            releaseDate.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            releaseDate.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    func buttonConstraint(){
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iTunesButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            iTunesButton.topAnchor.constraint(equalTo: releaseDate.bottomAnchor,constant: 500),
            iTunesButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            iTunesButton.heightAnchor.constraint(equalToConstant: 50),
            iTunesButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
}
