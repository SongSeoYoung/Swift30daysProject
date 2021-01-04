//
//  ViewController.swift
//  Project 04 - TodoTDD
//
//  Created by 송서영 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as? TodoTableViewCell else{ return UITableViewCell() }
        
        cell.dateLabel.text = ListData.shared.date
        cell.placeLabel.text = ListData.shared.place
        cell.titleLabel.text = ListData.shared.title
        return cell
    }
    
    
}
