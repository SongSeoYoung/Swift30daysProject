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
    var smallTimer = Timer()
    var number = 0
    var play: Bool = false
    var resetCheck: Bool = false
    var counter: Int = 0
    var currentTime: String?
    var number2 = 0
    var lapCheck: Bool = false {
        didSet{
            print("lap check is changed")
            number2 = 0
            var array: [String] = ["00", "00"]
            array = makeTimeLabel(number: number2)
            print(array)
            countLabel2.text = String("00:\(array[0]).\(array[1])")
        }
    }
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
                LapData("Lap \(counter)", self.countLabel1.text ?? "00")
            )
            tableView.reloadData()
            lapCheck = !lapCheck
        }
    }
    
    @IBAction private func StartBtn(_ sender: UIButton) {
        //타이머가 작동되지 않고 있을 때 누르는 경우
        if play == false{
            startStopBtn.setTitle("Stop", for: .normal)
            ResetLapBtn.setTitle("Lap", for: .normal)
            if !timer.isValid  {
                play = !play
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCallBack), userInfo: nil, repeats: true)
            }
            if !smallTimer.isValid {
                smallTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(smallTimercallBack), userInfo: nil, repeats: true)
            }
        }
        //타이머가 작동되고있을 때 누르는 경우
        else{
            timer.invalidate()
            smallTimer.invalidate()
            play = !play
            startStopBtn.setTitle("Start", for: .normal)
            ResetLapBtn.setTitle("Reset", for: .normal)
        }

    }
    
    @objc func timerCallBack() {
        var array: [String] = ["00", "00", "00"]
        number += 1
        array = makeTimeLabel(number: number)
        countLabel1.text = String("00:\(array[0]).\(array[1])")
        countLabel2.text = String("00:\(array[0]).\(array[1])")
    }
    
    @objc func smallTimercallBack() {
        var array: [String] = ["00", "00", "00"]
        number2 += 1
        array = makeTimeLabel(number: number2)
        countLabel2.text = String("00:\(array[0]).\(array[1])")
    }
    
    //00:00.00 에 맞춰서 보여질 수 있도록 변환
    func makeTimeLabel(number: Int) -> ([String]){
        var array: [String] = []
        
        var smallSec1 = number / 10
        if smallSec1 >=  100 {
            smallSec1 = smallSec1 % 100
        }
        let smallSec: String?
        if smallSec1 < 10{
            smallSec = "0\(smallSec1)"
        }else{
            smallSec = String(smallSec1)
        }
        
        
        let sec = (number / 100) % 60
        let realSec: String?
        if sec < 10{
            realSec = "0\(String(sec))"
        }else{
            realSec = String(sec)
        }
        array.append(realSec ?? "00")
        array.append(smallSec ?? "00")
        return array
    }
    
}


//MARK:- TableViewDelegate, TableViewDataSource
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
