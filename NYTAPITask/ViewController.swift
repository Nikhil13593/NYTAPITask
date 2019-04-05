//
//  ViewController.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 05/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var resultData:Result!
    var urlRequest:URLRequest!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        serverCommunication()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData?.title.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        return cell
    }

    func serverCommunication()
    {
        urlRequest = URLRequest(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=zuqMni6rqwy7i97bAhoAdJZXSEtCzZGg")!)
        
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            print(data as Any)
            do{
                self.resultData = try JSONDecoder().decode(Result.self, from: data!)
                
                DispatchQueue.main.async {
                    print(self.resultData ?? 0)
                    self.tableView.reloadData()
                }
                
            }catch{
                print("unable to get Respond")
            }
            }.resume()
    }
    override func viewWillAppear(_ animated: Bool) {
        serverCommunication()
    }
}

