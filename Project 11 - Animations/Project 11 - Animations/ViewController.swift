//
//  ViewController.swift
//  Project 11 - Animations
//
//  Created by 송서영 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    let list: [String] = [
        "2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position", "Color and Frame Change", "View Fade In", "Pop"
    ]
    let detailView1: [Int] = [0,1,2,3,5,7]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let vc: DetailViewController = segue.destination as? DetailViewController else {return}
//        guard let cell: UITableViewCell = sender as? UITableViewCell else {return}
//        if let indexPath = tableView.indexPath(for: cell) {
//            vc.rowTitle = list[indexPath.row]
//        }
//    }

}

//MARK:- TableView Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if detailView1.contains(indexPath.row) {
            guard let vc: DetailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
            vc.rowTitle = list[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if list[indexPath.row] == "BezierCurve Position" {
            guard let vc: BeizerPathViewController = self.storyboard?.instantiateViewController(identifier: "BeizerPathViewController") as? BeizerPathViewController else {return}
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            guard let vc: Detail2ViewController = self.storyboard?.instantiateViewController(identifier: "Detail2ViewController") as? Detail2ViewController else {return}
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }
}
