//
//  SecondViewController.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import UIKit

class SecondViewController: UIViewController {
    private var works:[Works]=[] {
        didSet{
            self.worksTableView.reloadData()
        }
    }
    private var checking:[Bool] = []
    var artistName: String?
    var artistNumber: Int?
    @IBOutlet weak var worksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = artistName
        worksTableView.rowHeight = UITableView.automaticDimension
        worksTableView.estimatedRowHeight = 300
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    
    func getData(){
        let jsonDecocder: JSONDecoder = JSONDecoder()
        guard let data: NSDataAsset = NSDataAsset(name: "artists") else {return}
        do{
            let artistWorks = try jsonDecocder.decode(WorkModel.self, from: data.data)
            guard let number = artistNumber else{ return }
            self.works = artistWorks.artists[number].works
        } catch {
            print(error.localizedDescription)
        }
        self.worksTableView.reloadData()
        
        for _ in 0..<works.count {
            checking.append(false)
        }
    }
    

}

//MARK:- TableView Delegate, DataSource
extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: WorksTableViewCell = worksTableView.dequeueReusableCell(withIdentifier: "WorksTableViewCell", for: indexPath) as? WorksTableViewCell else { return UITableViewCell() }
        if let artTitle = works[indexPath.row].title, let artImage = works[indexPath.row].image, let artInfo = works[indexPath.row].info {
            cell.imageBtn.setImage(UIImage(named: artImage), for: .normal)
            cell.ArtNameBtn.setTitle(artTitle, for: .normal)
            cell.textView.text = checking[indexPath.row] ? artInfo : "show more data >"
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checking[indexPath.row] = !checking[indexPath.row]

        worksTableView.beginUpdates()
        worksTableView.endUpdates()
        worksTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        worksTableView.reloadData()
    }
}
