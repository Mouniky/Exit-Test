//
//  AlamofireViewController.swift
//  Friday_MapsProject
//
//  Created by Mounik Yelakanti on 12/24/18.
//  Copyright © 2018 Mounik Yelakanti. All rights reserved.
//

import UIKit
import Alamofire

var name : [String] = []
var url : [String] = []
var countryInfo : [String] = []

class AlamofireViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    let urlString = "https://newsapi.org/v2/sources?apiKey=a8317d76bad448f78847c06b06e4e340"
    
    
    @IBOutlet weak var tableViewForAPI: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initiateServiceCall()
        
        
        }
    
    func initiateServiceCall()  {
        
        
        let request = NSMutableURLRequest()
        request.url = URL.init(string: urlString)
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // create session managere
        
        let sessionService = URLSession.shared
        
        let dataTask = sessionService.dataTask(with: request as URLRequest){(data,response,error) in
            
            
            if data != nil{
                let dict: [String : Any] = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : Any]
                //print(dict)
                
                let itemsArray = dict["sources"] as! [Any]
                
                
                for dictionary in itemsArray{
                    let itemDictionary = dictionary as! [String : Any]
                    
                    let nameArray = itemDictionary["name"] as! String
                    
                    let countryInfoArray = itemDictionary["country"] as! String
                    
                    
                    let urlArray = itemDictionary["url"] as! String
                    
                    
                    countryInfo.append(countryInfoArray)
                    
                    name.append(nameArray)
                    
                    url.append(urlArray)
                }
                
                print(name)
                print(countryInfo)
                print(url)
                
                
            }else{
                print("Error fetching data from service")
            }
            DispatchQueue.main.async {
                self.tableViewForAPI.reloadData()
            }
            
        }
        
        dataTask.resume()
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return name.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = name[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "First") as! AlamofireFirstViewController
//        viewController.countryInfo = countryInfo
//        viewController.url = url
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
        
    }
    
    
    
    
    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


