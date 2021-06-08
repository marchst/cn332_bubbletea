//
//  ToppingFactory.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 16/5/2564 BE.
//

import Foundation
import Firebase

class ToppingFactory: ObservableObject {
    private let collectionName = "toppings"
    private let db = Firestore.firestore()
    @Published var toppings: [Topping] = []
    
    init() {
        loadAll()
    }
    
    private func loadAll() {
        db.collection(collectionName).getDocuments { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
        
            guard let documents = snapshot?.documents else {
                return
            }
            
            self.toppings = documents.compactMap { document in
                let data = document.data()
                guard let name = data["name"] as? String,
                      let price = data["price"] as? String
                else {
                    return nil
                }
                return Topping(id: document.documentID, name: name, price: price)
            }
        }
    }
}


