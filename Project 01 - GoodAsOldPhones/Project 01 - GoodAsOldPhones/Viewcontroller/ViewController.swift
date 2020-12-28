//
//  ViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by 송서영 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let data: [Model] = [
        Model(Title: "1907 Wall Set", Image: UIImage(named: "image-cell1")!),
        Model(Title: "1921 Dial Phone", Image: UIImage(named: "image-cell2")!),
        Model(Title: "1937 Desk Set", Image: UIImage(named: "image-cell3")!),
        Model(Title: "1984 Moto Portable", Image: UIImage(named: "image-cell4")!)
    ]
    private var itemNumber: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let DetailViewController: DetailViewController = segue.destination as? DetailViewController else { return }
        guard let cell: TableViewCell = sender as? TableViewCell else { return }
        let indexPath = tableView.indexPath(for: cell)
        DetailViewController.cellImage = indexPath?.row
        DetailViewController.cellTitle = cell.cellTitle.text
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.cellImg.image = data[indexPath.row].Image
        cell.cellTitle.text = data[indexPath.row].Title
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.itemNumber = indexPath.row
//        guard let vc: DetailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
//        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return }
////
////        vc.cellItem = self.itemNumber
////        vc.cellTitle = cell.cellTitle.text
//    }
    
}


