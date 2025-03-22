//
//  AddProductViewController.swift
//  A2_iOS_berlean_101465969
//
//  Created by Joshua Nuezca on 2025-03-22.
//

import UIKit

class AddProductViewController : UIViewController{
    
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var providerTextField: UITextField!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
    }
    
}
