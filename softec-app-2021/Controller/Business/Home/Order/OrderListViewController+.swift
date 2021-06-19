//
//  OrderListViewController+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit

//MARK:- Extension UITableView
extension OrderListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foramtter = DateFormatter()
        foramtter.timeStyle = .medium
        foramtter.dateStyle = .long
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
        
        cell.timeLabel.text = convertDateTimeFromTimeStamp(timestamp: Int(NSDate().timeIntervalSince1970))
        
        return cell

    }
}
