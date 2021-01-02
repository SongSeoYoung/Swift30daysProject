//
//  ViewController.swift
//  Project 03 - FacebookMe
//
//  Created by 송서영 on 2021/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:     //profile
            return 1
        case 1:     //data1
            return data1.count
        case 2:     //data2
            return data2.count
        case 3:     //data3
            return data3.count
        case 4:     //logout
            return 1
        default:
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.cellImage.image = data1[indexPath.row].image
            cell.cellLabel.text = data1[indexPath.row].title
            return cell
        case 2:
            guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.cellImage.image = data2[indexPath.row].image
            cell.cellLabel.text = data2[indexPath.row].title
            return cell
        case 3:
            guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.cellImage.image = data3[indexPath.row].image
            cell.cellLabel.text = data3[indexPath.row].title
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell", for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 2 ? "Favorites" : nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = .systemGray6
//        let label = UILabel()
//        label.text = " FAvofites"
//        backgroundView.addSubview(label)
//        return backgroundView
//    }
    
}

