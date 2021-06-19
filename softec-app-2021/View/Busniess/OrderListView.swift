//
//  OrderListView.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit

class OrderListView: UIView {

    var ordersTable: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        let nib = UINib(nibName: "OrderListTableViewCell", bundle: nil)
        tb.register(nib, forCellReuseIdentifier: "OrderListTableViewCell")
        return tb
    }()
    
    func configureScreen(view: UIView, top: Int){
        view.addSubview(ordersTable)
        ordersTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        ordersTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        ordersTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ordersTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}
