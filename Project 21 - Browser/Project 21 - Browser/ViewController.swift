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
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    
    var backStack: [URL?] = [URL?]()
    var forwardStack: [URL?] = [URL?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       setInit()
    }
    func setInit() {
        guard let defaultURL = URL(string: "https://www.apple.com/kr/") else { return }
        let request = URLRequest(url: defaultURL)
        webView.load(request)
        textField.text = "https://www.apple.com/kr/"
        textField.keyboardType = .URL
        backBtn.isEnabled = false
        forwardBtn.isEnabled = false
        backStack.append(defaultURL)
    }
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
        guard let requestURL = URL(string: "https://" + textField.text!) else { return }
        let request = URLRequest(url: requestURL)
        webView.load(request)
        backStack.append(requestURL)
        backBtnEnable()
        forwardBtnEnable()
    }
    @IBAction func backBtn(_ sender: Any) {
        if backStack.count > 1 {
            forwardStack.append(backStack.popLast()!)
            let backURL = backStack[backStack.count - 1]
            let request = URLRequest(url: backURL!)
            webView.load(request)
        }
        backBtnEnable()
        forwardBtnEnable()
    }
    @IBAction func reloadBtn(_ sender: Any) {
        guard let requestURL = URL(string: textField.text ?? "https://www.apple.com/kr/") else { return }
        let request = URLRequest(url: requestURL)
        webView.load(request)
    }
    @IBAction func forwardBtn(_ sender: Any) {
        let forwardURL = forwardStack.popLast()!
        let request = URLRequest(url: forwardURL!)
        webView.load(request)
        backBtnEnable()
        forwardBtnEnable()
    }
    
}

// MARK: - ViewController Extension
extension ViewController {
    func backBtnEnable(){
        if backStack.count - 2 >= 0 {
            backBtn.isEnabled = true
        }else{
            backBtn.isEnabled = false
        }
    }
    
    func forwardBtnEnable() {
        if forwardStack.count >= 1 {
            forwardBtn.isEnabled = true
        }else{
            forwardBtn.isEnabled = false
        }
    }
}

