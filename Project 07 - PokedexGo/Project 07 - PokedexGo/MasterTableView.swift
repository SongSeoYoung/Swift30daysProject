//
//  MasterTableView.swift
//  Project 07 - PokedexGo
//
//  Created by 송서영 on 2021/01/16.
//

import UIKit
import Kingfisher

class MasterTableView: UITableViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MasterTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MasterTableViewCell else { return UITableViewCell() }
        cell.title.text = pokemons[indexPath.row].name
        cell.label.text = pokemons[indexPath.row].detailInfo
        guard let pokeImgString = pokemons[indexPath.row].pokeImgUrl else { print(fatalError()) }
        print(pokeImgString)
        let url: URL? = URL(string: pokeImgString)
        cell.img.kf.setImage(with: url, placeholder: UIImage(named: "default_img"))
        return cell
    }
}


