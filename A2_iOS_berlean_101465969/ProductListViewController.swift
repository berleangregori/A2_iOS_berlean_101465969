//
//  ProductListViewController.swift
//  A2_iOS_berlean_101465969
//
//  Created by Joshua Nuezca on 2025-03-22.
//

import  UIKit


class ProductListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var products: [Product] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        products = CoreDataManager.shared.fetchProducts()
    }
    
    // MARK: - TableView Data  Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "ProductCell")
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.desc
        return cell
    }
    
    
    
    
}
