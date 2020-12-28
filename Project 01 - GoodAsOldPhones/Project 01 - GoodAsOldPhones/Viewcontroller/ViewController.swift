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
    
    //실패한 코드!!!
    //다음 뷰 컨트롤러에 데이터를 보내려면 prepare 메서드에서 해야지
    //여기서 하면 해당 파일 안에서만 vc의 프로퍼티 값이 변경되고, 우리가 원하는 다음 뷰컨에서는 바뀌지 않음
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.itemNumber = indexPath.row
//        guard let vc: DetailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
//        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return }
//
//        print(itemNumber)
//        vc.cellImage = self.itemNumber
//        vc.cellTitle = cell.cellTitle.text
//    }
    
}


