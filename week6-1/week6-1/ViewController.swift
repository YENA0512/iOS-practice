//
//  ViewController.swift
//  week6-1
//
//  Created by 이예나 on 11/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmData.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {return UITableViewCell()}
        //print(cell.timeLabel?.text)
        cell.ampmLabel.text = AlarmData.list[indexPath.row].ampmInfo
        cell.timeLabel?.text = "\(AlarmData.list[indexPath.row].hour) : \(AlarmData.list[indexPath.row].minute)"
        cell.isActive?.isOn = AlarmData.list[indexPath.row].active ? true : false
//
        return cell
    }
    
}



struct AlarmData {
    let ampmInfo: String
    let hour: String
    let minute: String
    let active: Bool
}

extension AlarmData {
    static let list = [
        AlarmData(ampmInfo: "PM", hour: "12", minute: "15", active: false),
        AlarmData(ampmInfo: "AM", hour: "11", minute: "13", active: true),
        AlarmData(ampmInfo: "PM", hour: "10", minute: "15", active: false),
    ]
}
