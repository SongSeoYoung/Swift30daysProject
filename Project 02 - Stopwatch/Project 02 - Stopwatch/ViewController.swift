//
//  ViewController.swift
//  Project 02 - Stopwatch
//
//  Created by 송서영 on 2020/12/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var countLabel2: UILabel!
    @IBOutlet private weak var countLabel1: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var ResetLapBtn: UIButton!
    
    private var lapData:[LapData] = []
    var timer = Timer()
    var number = 0
    var play: Bool = false
    var resetCheck: Bool = false
    var counter: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction private func ResetBtn(_ sender: UIButton) {
        //reset 시키자
        if ResetLapBtn.title(for: .normal) == "Reset" {
            countLabel1.text = "00:00.00"
            number = 0
            lapData = []
            counter = 0
            tableView.reloadData()
        }
        //lap 추가하자
        else{
            counter += 1
            lapData.append(
                LapData("Lap \(counter)", String(number))
            )
            tableView.reloadData()
        }
        
    }
    
    @IBAction private func StartBtn(_ sender: UIButton) {
        //타이머가 작동되지 않고 있을 때 누르는 경우
        if play == false{
            startStopBtn.setTitle("Stop", for: .normal)
            ResetLapBtn.setTitle("Lap", for: .normal)
            if !timer.isValid {
                play = !play
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCallBack), userInfo: nil, repeats: true)
            }
            
        }
        //타이머가 작동되고있을 때 누르는 경우
        else{
            timer.invalidate()
            play = !play
            startStopBtn.setTitle("Start", for: .normal)
            ResetLapBtn.setTitle("Reset", for: .normal)
        }

    }
    @objc func timerCallBack() {
        number += 1
        makeTimeLabel(number: number)
        countLabel1.text = String(number)
    }
    
    func makeTimeLabel(number: Int){
        let sec = (number / 100) % 60
        let smallSec: Float = (Float((number / 100)) - Float(sec)) * 100
        let min = (number / 100) / 60
        
        print(smallSec, "samll")
        print(sec, "sec")
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LapTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LapTableViewCell", for: indexPath) as? LapTableViewCell else { return UITableViewCell() }
        
        cell.countTitle.text = lapData[indexPath.row].LapTime
        cell.lapTitle.text = lapData[indexPath.row].LapTitle
        return cell
        
    }
    
    
}
