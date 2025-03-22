//
//  ViewController.swift
//  A2_iOS_berlean_101465969
//
//  Created by Joshua Nuezca on 2025-03-22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var products: [Product] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetch products from Core Data
        products = CoreDataManager.shared.fetchProducts()
                
                // If empty, seed with default products
        if products.isEmpty {
            seedSampleProducts()
            products = CoreDataManager.shared.fetchProducts()
        }
                
                // Display first product
        showCurrentProduct()
    }
    
    func showCurrentProduct() {
        guard products.indices.contains(currentIndex) else { return }
        let product = products[currentIndex]
        nameLabel.text = product.name
        descLabel.text = product.desc
        priceLabel.text = "$\(product.price)"
        providerLabel.text = product.provider
    }
    
    func seedSampleProducts() {
        for i in 1...10 {
            CoreDataManager.shared.addProduct(
                id: UUID().uuidString,
                name: "Product \(i)",
                desc: "This is a description for product \(i).",
                price: Double(i) * 5.0,
                provider: "Provider \(i)"
            )
        }
    }

    @IBAction func prevTapped(_ sender: Any) {
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % products.count
        showCurrentProduct()
    }
    
    @IBAction func searchTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    @IBAction func listTapped(_ sender: Any) {
    }
    
    
}

