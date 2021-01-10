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
    var artistName: String?
    var artistNumber: Int?
    @IBOutlet weak var worksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(artistNumber)
        print(artistName)
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
    }


}

//MARK:- TableView Delegate, DataSource
extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        return cell
    }
    
    
}
