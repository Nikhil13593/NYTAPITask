//
//  ViewController.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 05/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK: Global Var Declation
    var resultData:Model!
    var urlRequest:URLRequest!
    var titleArray: [String] = []
    var abstractArray: [String] = []
    var urlArray: [String] = []
    
    //MARK: Var Connection Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.serverCommunication()
    }
}

// MARK:- UITableView Delegate & Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 300 
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.titleLbl?.text = titleArray[indexPath.row]
        cell.abstractLbl?.text = abstractArray[indexPath.row]
        cell.urlLbl?.text = urlArray[indexPath.row]

        return cell
    }
}

// MARK:- Function for ServerCommunication
extension ViewController{
    
    func serverCommunication(){
        urlRequest = URLRequest(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=zuqMni6rqwy7i97bAhoAdJZXSEtCzZGg")!)
        
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (alldata, resp, err) in
            
            print("\(alldata)")
        do{
                
            self.resultData = try JSONDecoder().decode(Model.self, from: alldata!)
               
            var serverData = self.resultData.results
                
                for i in 0..<self.resultData.results.count{
                    self.titleArray.append(self.resultData.results[i].title!)
                    self.abstractArray.append(self.resultData.results[i].abstract!)
                    self.urlArray.append(self.resultData.results[i].url!)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print("Unable to Get Respond from Server")
            }
        }.resume()
    }
}
