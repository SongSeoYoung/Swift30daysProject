//
//  ViewController.swift
//  Project 21 - Browser
//
//  Created by 송서영 on 2021/03/02.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    var queue: [String] = ["https://www.apple.com/kr/"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let defaultURL = URL(string: "https://www.apple.com/kr/") else { return }
        let request = URLRequest(url: defaultURL)
        webView.load(request)
        textField.text = "https://www.apple.com/kr/"
        textField.keyboardType = .URL
    }

    @IBAction func textFieldDidEnd(_ sender: Any) {
        guard let requestURL = URL(string: textField.text ?? "https://www.apple.com/kr/") else { return }
        let request = URLRequest(url: requestURL)
        webView.load(request)
        queue.append(textField.text ?? "https://www.apple.com/kr/")
    }
    @IBAction func backBtn(_ sender: Any) {
        
    }
    @IBAction func reloadBtn(_ sender: Any) {
        guard let requestURL = URL(string: textField.text ?? "https://www.apple.com/kr/") else { return }
        let request = URLRequest(url: requestURL)
        webView.load(request)
    }
    @IBAction func forwardBtn(_ sender: Any) {
        
    }
}

