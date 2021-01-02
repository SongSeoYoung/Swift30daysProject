//
//  ViewController.swift
//  Project 03 - FacebookMe
//
//  Created by 송서영 on 2021/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    //make CustomCell
    private func makeCustomCell(_ data: [Model], _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.cellImage.image = data[indexPath.row].image
        cell.cellLabel.text = data[indexPath.row].title
        return cell
    }

}

//MARK: - extension tableView

//section 별 셀 갯수
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
    //총 섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //cell 데이터 값
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell: CustomTableViewCell = makeCustomCell(data1, indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            if indexPath.row == 6 {
                cell.cellLabel.textColor = .blue
            }
            return cell
        case 2:
            guard let cell: CustomTableViewCell = makeCustomCell(data2, indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.cellLabel.textColor = .red
            return cell
        case 3:
            guard let cell: CustomTableViewCell = makeCustomCell(data1, indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell", for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    //header title 지정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 2 ? "Favorites" : nil
    }
    //header height 지정prv
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
}

