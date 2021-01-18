//
//  ViewController.swift
//  Project 08 - SimpleRSSReader
//
//  Created by 송서영 on 2021/01/18.
//

import UIKit
import AlamofireRSSParser
import Alamofire

class ViewController: UIViewController {

    var data:[Model] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    let url: String = "http://www.apple.com/main/rss/hotnews/hotnews.rss"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        print("parser")
        AF.request(url).responseRSS() { (response) -> Void in
            if let feed: RSSFeed = response.value {
                /// Do something with your new RSSFeed object!
                for item in feed.items {
                    if let title = item.title,
                       let date = item.pubDate,
                       let description = item.itemDescription {
                        self.data.append(Model(title, date, description))
                    }
                }
            }
        }
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RSSReaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RSSReaderTableViewCell") as? RSSReaderTableViewCell else {return UITableViewCell()}
        cell.titleLabel.text = data[indexPath.row].title
        cell.newLabel.text = data[indexPath.row].itemDescription
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/mm/dd HH:mm:ss"
        if let date = data[indexPath.row].pubDate {
            let dateString: String = dateFormatter.string(from: date)
            cell.dateTimeLabel.text = dateString
        }
        return cell
    }


}
