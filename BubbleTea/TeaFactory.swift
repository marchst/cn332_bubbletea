//
//  TeaFactory.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 16/5/2564 BE.
//

import Foundation
import Firebase

class TeaFactory: ObservableObject {
    private let collectionName = "teas"
    private let db = Firestore.firestore()
    @Published var teas: [Tea] = []
    @Published var orders: [Order] = []
    
    init() {
        loadAll()
    }

    func addToArray(name: String, price: String){
        orders.append(Order(name: name,price: price))
    }
    
    func clearArray() {
        orders = []
    }
    
    func allPrice() -> String {
        var allprice = 0
        for order in orders {
            allprice = allprice + Int(order.price)!
        }
        return "\(allprice)"
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
            
            self.teas = documents.compactMap { document in
                let data = document.data()
                guard let name = data["name"] as? String,
                      let price = data["price"] as? String
                else {
                    return nil
                }
                return Tea(id: document.documentID, name: name, price: price)
            }
        }
    }
}

