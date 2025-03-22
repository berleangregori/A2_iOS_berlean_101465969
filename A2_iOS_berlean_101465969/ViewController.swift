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

    @IBAction func prevTapped(_ sender: Any) {
    }
    
    @IBAction func nextTapped(_ sender: Any) {
    }
    
    @IBAction func searchTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    @IBAction func listTapped(_ sender: Any) {
    }
    
    
}

