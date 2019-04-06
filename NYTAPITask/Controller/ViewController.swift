//
//  ViewController.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 05/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController{
    
    //MARK: Global Var Declation
    var resultData:Model!
    var urlRequest:URLRequest!
    var titleArray: [String] = []
    var abstractArray: [String] = []
    var publishedDateArray: [String] = []
    var urlImageArray: [String] = []
    var copyright: [String] = []
    
    let formatter = DateFormatter()
    
    //MARK: Var Connection Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 450.0  //Give an approximation here
        tableView.rowHeight = UITableView.automaticDimension
        self.serverCommunication()
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
                self.publishedDateArray.append(self.resultData.results[i].published_date!)
                    
                    let multiMedia = self.resultData.results[i].multimedia[3].url
                    let compright = self.resultData.results[i].multimedia[3].copyright
                    
                    self.urlImageArray.append(multiMedia as! String)
                    self.copyright.append(compright as! String)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            catch
            {
                print("Unable to Get Respond from Server")
            }
        }.resume()
    }
}

// MARK:- UITableView Delegate & Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.titleLbl.text = titleArray[indexPath.row]
        cell.abstractLbl.text = abstractArray[indexPath.row]
        
        let URLString =  urlImageArray[indexPath.row]
        
        cell.copyrightsLbl.text = copyright[indexPath.row]
        
        cell.imageURLOfImageView.sd_setImage(with: URL(string: "\(URLString)"), placeholderImage: UIImage(named: "placeholder.png"))

        cell.publishedDateLbl.text = publishedDateArray[indexPath.row]

        return cell
    }
    
    
    
}

