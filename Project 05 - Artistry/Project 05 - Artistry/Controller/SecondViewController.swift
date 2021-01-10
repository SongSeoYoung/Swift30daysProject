//
//  SecondViewController.swift
//  Project 05 - Artistry
//
//  Created by 송서영 on 2021/01/10.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var checking:[Bool] = []        //info 를 보여줘야하는지 체킹하는 bool 값을 담은 배열
    var artistName: String?
    var artistNumber: Int?
    
    private var works:[Works]=[] {
        didSet{
            self.worksTableView.reloadData()
        }
    }
    @IBOutlet private weak var worksTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = artistName
        worksTableView.rowHeight = UITableView.automaticDimension
        worksTableView.estimatedRowHeight = 300
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    //data fetch
    private func getData(){
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
        
        //data 갯수만큼 checking에 default value false 를 넣어줌.
        for _ in 0..<works.count {
            checking.append(false)
        }
    }
    

}

//MARK:- TableView Delegate, DataSource
extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: WorksTableViewCell = worksTableView.dequeueReusableCell(withIdentifier: "WorksTableViewCell", for: indexPath) as? WorksTableViewCell else { return UITableViewCell() }
        if let artTitle = works[indexPath.row].title, let artImage = works[indexPath.row].image, let artInfo = works[indexPath.row].info {
            cell.imageBtn.setImage(UIImage(named: artImage), for: .normal)
            cell.ArtNameBtn.setTitle(artTitle, for: .normal)
            cell.textView.text = checking[indexPath.row] ? artInfo : "show more data >"
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //checking 값 바꾸기
        checking[indexPath.row] = !checking[indexPath.row]
        //beginUpdates() -> insert, remove, append, selection 등과 같이 Cell or section 에 무언가 바뀜의 시작을 의미
        worksTableView.beginUpdates()
        //endUpdates() -> 바뀜의 끝을 의미
        worksTableView.endUpdates()
        worksTableView.reloadData()     //데이터를 다시 불러와야함.
        //indexPath 에 맞춰서 vertical 하게 스크롤하는
        worksTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
