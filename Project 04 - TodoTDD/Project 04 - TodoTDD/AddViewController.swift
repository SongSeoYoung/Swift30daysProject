//
//  AddViewController.swift
//  Project 04 - TodoTDD
//
//  Created by 송서영 on 2021/01/04.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UITextField!
    @IBOutlet private weak var placeLabel: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var descriptionLabel: UITextField!
    @IBOutlet private weak var saveBtn: UIButton!
    private var dateToString: String?
    private let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
        // Do any additional setup after loading the view.
    }
    private func initial(){
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
