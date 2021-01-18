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

    private var data:[Model] = [] {
        didSet{
            self.tableView.reloadData()
            for _ in 0..<data.count {
                isClicked.append(false)
            }
        }
    }
    private let url: String = "http://www.apple.com/main/rss/hotnews/hotnews.rss"
    private var isClicked: [Bool] = []
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        RSSParser()
    }
    func RSSParser(){
        AF.request(url).responseRSS() { (response) -> Void in
            if let feed: RSSFeed = response.value {
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
//MARK:- tableView extension
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
        //cell expand
        if isClicked[indexPath.row] {
            cell.newLabel.numberOfLines = 0
        }
        else{
            cell.newLabel.numberOfLines = 4
        }
        
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //changing the cell clicked bool value
        isClicked[indexPath.row] = !isClicked[indexPath.row]
        //scroll event
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }

}
