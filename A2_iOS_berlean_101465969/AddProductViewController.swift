//
//  AddProductViewController.swift
//  A2_iOS_berlean_101465969
//
//  Created by Joshua Nuezca on 2025-03-22.
//

import UIKit

class AddProductViewController : UIViewController{
    
    
  
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descTextField: UITextField!
    
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var providerTextField: UITextField!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Add Product"
    }
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let desc = descTextField.text,
              let priceString = priceTextField.text,
              let price = Double(priceString),
              let provider = providerTextField.text,
              !name.isEmpty else {
            print("Missing or invalid input")
            return
        }
        
        let id = UUID().uuidString
        
        CoreDataManager.shared.addProduct(
            id: id,
            name: name,
            desc: desc,
            price: price,
            provider: provider
        )
        
        // Dismiss or pop back to main view
        navigationController?.popViewController(animated: true)
    }
}
        
    

