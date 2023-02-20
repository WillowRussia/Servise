//
//  ViewController.swift
//  Services
//
//  Created by Willow on 18.02.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [Item]()
    let cellId = ServiceTableViewCell.cellId
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        ParsingJSON { data in
            self.items = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    func ParsingJSON(completed: @escaping ([Item]) -> ()) {
        let API = "https://mobile-olympiad-trajectory.hb.bizmrg.com/semi-final-data.json"
        guard let url = URL(string: API) else{print("Ошибка");return}
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            if let ParsingData = try? JSONDecoder().decode(VKServices.self, from: data){
                completed(ParsingData.items)
            } else{
                print("error")}
            }
        dataTask.resume()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ServiceTableViewCell
        let items = items[indexPath.row]
        cell.logo.sd_setImage(with: URL( string: items.iconURL))
        cell.title.text = items.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 
        return 76.0
    }
    
}
