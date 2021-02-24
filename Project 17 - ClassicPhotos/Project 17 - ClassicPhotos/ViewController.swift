//
//  ViewController.swift
//  Project 17 - ClassicPhotos
//
//  Created by 송서영 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet private weak var tableView: UITableView!

    let viewModel: tableViewModel = tableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.decodeURL())
    }
    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell
    }

}
