//
//  ViewController.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var ArtistryTablleView: UITableView!
    private var ArtistModel :[Artist] = [] {
        didSet{
            ArtistryTablleView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavBar()
        fetchData()
        ArtistryTablleView.rowHeight = UITableView .automaticDimension
        ArtistryTablleView.estimatedRowHeight = 400
    }
    func settingNavBar(){
        self.title = "Artistry"
    }
    
    func fetchData(){
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let data: NSDataAsset = NSDataAsset(name: "artists") else{return}
        do {
            let totalData = try jsonDecoder.decode(Model.self, from: data.data)
            self.ArtistModel = totalData.artists
        } catch{
            print(error.localizedDescription)
        }
        self.ArtistryTablleView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        guard let SecondViewcontroller: SecondViewController = segue.destination as? SecondViewController else { return }
        guard let cell: ArtistryTableViewCell = sender as? ArtistryTableViewCell else { return }
        let indexPath = ArtistryTablleView.indexPath(for: cell)
        SecondViewcontroller.artistName = ArtistModel[indexPath?.row ?? 0].name ?? "l"
        SecondViewcontroller.artistNumber = indexPath?.row
    }

    
}

//MARK:- TableView Delegate, Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArtistModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ArtistryTableViewCell = ArtistryTablleView.dequeueReusableCell(withIdentifier: "ArtistryTableViewCell", for: indexPath) as? ArtistryTableViewCell else{ return UITableViewCell() }
        if let artistImg = ArtistModel[indexPath.row].image, let artistName = ArtistModel[indexPath.row].name, let artistBio = ArtistModel[indexPath.row].bio{
            cell.artistImg.image = UIImage(named: artistImg)
            cell.artistBio.text = artistBio
            cell.artistNameBtn.setTitle(artistName, for: .normal)
            
        }
        return cell
    }
    
    
}

