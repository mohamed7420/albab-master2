//
//  ViewController.swift
//  testWebViewApp
//
//  Created by Mohamed on 7/16/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate , UIWebViewDelegate{

    
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: UIWebView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let url = URL(string: "https://www.3l-bab.com/?fbclid=IwAR2fbf8BbDDpRE2u76aYQNpmrp2EajHrvxKUukpd2YPeG-zRK37CG1NYYmw")
        
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)
        webView.delegate = self
        webView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
       // webView.navigationDelegate = self
       activityIndicator.hidesWhenStopped = true
        
        if CheckInternet.Connection(){
            
            // self.Alert(Message: "Connected")
            
        }
            
        else{
            
            self.Alert(Message: "يرجي الاتصال بالانترنت٫٫٫")
            
        }
        

    }
   
    override func viewDidAppear(_ animated: Bool) {
        
        if CheckInternet.Connection(){
            
            // self.Alert(Message: "Connected")
            
        }
            
        else{
            
            self.Alert(Message: "يرجي الاتصال بالانترنت٫٫٫")
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView.isLoading{
            
            return
        }
        activityIndicator.stopAnimating()
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start loading")
       activityIndicator.startAnimating()
    }
    
    
    @IBAction func btn_Back(_ sender: Any) {
    
        if webView.canGoBack{
            
            webView.goBack()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func Alert (Message: String){
        
        let alert = UIAlertController(title: "تنبيه", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {
            
            action in ViewController().dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}

