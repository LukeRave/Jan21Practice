//
//  ViewController.swift
//  displayMusicList
//
//  Created by Rave Training on 1/27/22.
//

import UIKit

class ViewController: UIViewController {
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    let edgeOffset: CGFloat = 5
    let staticHeight: CGFloat = 50
    let submitButton = UIButton()
    let titleLabel = UILabel()
    let musicTable = UITableView()
    var feed: MusicFeed? { didSet { DispatchQueue.main.async { self.musicTable.reloadData() } } }
    var albumList: [AlbumData] { get { feed?.feed?.results ?? [] } }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        musicTable.dataSource = self
        musicTable.delegate = self
        let nib = UINib(nibName: "AlbumCell", bundle: nil)
        musicTable.register(nib, forCellReuseIdentifier: "AlbumCell")
        initSubmitButton()
        initTitleLabel()
        initMusicTable()
//        handleSubmitButton()
    }
    /// Create the definitions and constraints for the table view
    func initMusicTable() {
        musicTable.translatesAutoresizingMaskIntoConstraints = false
        musicTable.backgroundColor = UIColor.white
        self.view.addSubview(musicTable)
        NSLayoutConstraint.activate([
            musicTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edgeOffset + staticHeight),
            musicTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            musicTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            musicTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(staticHeight - edgeOffset))
        ])
    }
    /// Create the submit button to make the API Call at the bottom of the screen
    func initSubmitButton() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Load Music Data", for: .normal)
        submitButton.backgroundColor = UIColor.blue
        submitButton.titleLabel?.textColor = UIColor.white
        submitButton.addAction {self.handleSubmitButton()}
        self.view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: edgeOffset),
            submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: staticHeight)
        ])
    }
    /// Create the display label at the top of the screen to display the collection information
    func initTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = UIColor.blue
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edgeOffset),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: staticHeight),
        ])
    }
//    API Call to retreive music data
    func handleSubmitButton() {
        guard let url = URL(string: musicStr) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {print(error ?? "No Data");return}
            guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else {print(error ?? "ResponseCode != 200");return}
            do {
                let model = try JSONDecoder().decode(MusicFeed.self, from: data)
                DispatchQueue.main.async {
                    self.titleLabel.text = model.feed?.title
                }
                self.feed = model
            } catch { print(error) }
        }
        task.resume()
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return albumList.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as? AlbumCell else {return UITableViewCell()}
        NSLayoutConstraint.activate([
            cell.heightAnchor.constraint(equalToConstant: 110)
        ])
        let albumItem = albumList[indexPath.row]
        cell.albumTitle.text = "\(albumItem.albumName ?? "")\n--\(albumItem.artistName ?? "")"
        if let imageStr = albumItem.imageUrl, let url = URL(string: imageStr) {
            URLSession.shared.dataTask(with: url) { d, r, e in
                guard let data = d else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async { cell.albumImage.image = image }
            }.resume()
        }
        return cell
    }
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
}
extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}
