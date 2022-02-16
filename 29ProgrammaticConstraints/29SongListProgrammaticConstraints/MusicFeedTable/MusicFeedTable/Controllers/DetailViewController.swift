//
//  DetailViewController.swift
//  MusicFeedTable
//
//  Created by ravebizz on 2/16/22.
//

import UIKit

class DetailViewController: UIViewController {

    let art = UIImageView()
    let albumLabel = UILabel()
    let artistLabel = UILabel()
    let genreLabel = UILabel()
    let dateLabel = UILabel()
    let scrollView = UIScrollView()
    
    var albumModel: AlbumModel?
    var albumArt: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        
        if let img = albumArt {
            art.image = img
        }
        scrollView.addSubview(art)
        scrollView.addSubview(albumLabel)
        scrollView.addSubview(artistLabel)
        scrollView.addSubview(genreLabel)
        scrollView.addSubview(dateLabel)
        
        albumLabel.text = albumModel?.name
        artistLabel.text = albumModel?.artistName
        var myGenres = ""
        if let genres = albumModel?.genres {
            for genre in genres {
                if let name = genre.name?.rawValue {
                    myGenres += name
                }
            }
        }
        genreLabel.text = myGenres
        dateLabel.text = albumModel?.releaseDate
        
        setupConstraints()
    }

    func setupConstraints() {
        setupScrollViewConstraints()
        setupArtConstraints()
        setupAlbumLabelConstraints()
        setupArtistLabelConstraints()
        setupGenreLabelConstraints()
        setupDateLabelConstraints()
    }
    
    func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupArtConstraints() {
        art.translatesAutoresizingMaskIntoConstraints = false
        art.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        art.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        art.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        art.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.width).isActive = true
    }
    
    func setupAlbumLabelConstraints() {
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        albumLabel.topAnchor.constraint(equalTo: art.bottomAnchor).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        albumLabel.bottomAnchor.constraint(equalTo: art.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupArtistLabelConstraints() {
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupGenreLabelConstraints() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        genreLabel.bottomAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 20).isActive = true
    }
}
