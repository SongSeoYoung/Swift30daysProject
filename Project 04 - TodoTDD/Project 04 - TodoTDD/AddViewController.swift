//
//  AddViewController.swift
//  Project 04 - TodoTDD
//
//  Created by 송서영 on 2021/01/04.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var placeLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    var dateToString: String?
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "dd / mm / YYYY"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
        // Do any additional setup after loading the view.
    }
    func initial(){
        titleLabel.text = nil
        placeLabel.text = nil
        descriptionLabel.text = nil
    }
    

    @IBAction func savePressed(_ sender: Any) {
        print("save pressed")
        self.navigationController?.popViewController(animated: true)
        ListData.shared.title = titleLabel.text
        ListData.shared.place = placeLabel.text
        ListData.shared.date = dateToString
    }
    @IBAction func cancelPressed(_ sender: Any) {
        initial()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let date: Date = sender.date
        dateToString = self.dateFormatter.string(from: date)
    }
}
