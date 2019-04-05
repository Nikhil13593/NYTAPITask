//
//  ViewController.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 05/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    // Globel Declation
    
   // var resultData:Welcome!
    var urlRequest:URLRequest!
    
    
    // Connection
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.serverCommunication()
    }

}



// MARK:- UITable View Delegate & data Source

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return resultData?.results.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//
//        cell.titleLbl.text = resultData?.results[indexPath.row].section
//
//
//        return cell
//    }

    
}


// MARK:- Function
extension ViewController{
    
    func serverCommunication(){
        urlRequest = URLRequest(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=zuqMni6rqwy7i97bAhoAdJZXSEtCzZGg")!)
        
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (alldata, resp, err) in
            print(alldata)
            do{
                
                var resultData = try JSONDecoder().decode(Model.self, from: alldata!)
                
                
                
                for i in 0..<resultData.results.count{
                    print("\(i)==> Title \(resultData.results[i].title) ")
                    print("\(i)==> Abstract \(resultData.results[i].abstract) ")
                }
                
                DispatchQueue.main.async {
//                    print(self.resultData ?? 0)
                    self.tableView.reloadData()
                }
                
            }catch{
                print("Unable to Get Respond from Server")
            }
            }.resume()
    }
    
}
