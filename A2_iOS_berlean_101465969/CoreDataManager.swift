//
//  CoreDataManager.swift
//  A2_iOS_berlean_101465969
//
//  Created by Joshua Nuezca on 2025-03-22.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()

    let context: NSManagedObjectContext

    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }

    // Fetch all products
    func fetchProducts() -> [Product] {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Fetch error:", error)
            return []
        }
    }

    // Add new product
    func addProduct(id: String, name: String, desc: String, price: Double, provider: String) {
        let product = Product(context: context)
        product.id = id
        product.name = name
        product.desc = desc
        product.price = price
        product.provider = provider
        save()
    }

    // Search by name or description
    func searchProducts(keyword: String) -> [Product] {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[c] %@ OR desc CONTAINS[c] %@", keyword, keyword)
        do {
            return try context.fetch(request)
        } catch {
            print("Search error:", error)
            return []
        }
    }

    // Save context
    func save() {
        do {
            try context.save()
        } catch {
            print("Save error:", error)
        }
    }
}
