//
//  ViewController.swift
//  Day 10 - GitRepository
//
//  Created by Felix ITs 04 on 15/09/18.
//  Copyright © 2018 Akash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrList:Array<Dictionary<String,Any?>?>? = nil
    
    let strURL = "https://jsonplaceholder.typicode.com/posts"
    @IBOutlet var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        callPostAPI()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func callPostAPI(){
    let url = URL.init(string: strURL)
        
        //optional binding
        if let _ = url {
            let req = URLRequest.init(url: url!)
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: req, completionHandler: { (data, response, error) in
                if let _ = error {
                    print(error!)
                    return
                }
                
                if let value = data {
                    do {
                        
                       self.arrList = try JSONSerialization.jsonObject(with: value, options: .allowFragments) as? Array<Dictionary<String,Any>>
                        print(self.arrList!)
                        if let _ = self.arrList, self.arrList!.count > 0
                        {
                            self.tblView.dataSource = self
                            self.tblView.delegate = self
                            self.tblView.reloadData()
                        }
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            })
            dataTask.resume()
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let _ = arrList {
            return (arrList?.count)!
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! TableViewCell
        if let _ = arrList {
            let dict:Dictionary<String,Any>? = arrList![indexPath.row]!
            
            if let _ = dict {
                cell.lblTitle.text = dict!["title"] as? String
                let userID = dict!["userId"] as! Int
                cell.lblUserID.text = String(format: "%d", userID)
                cell.lblPassword.text = dict!["password"] as? String
            }
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

