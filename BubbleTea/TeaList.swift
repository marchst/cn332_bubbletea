//
//  TeaList.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 16/5/2564 BE.
//

import Foundation
import Firebase

class TeaList: ObservableObject {
    private let collectionName = "teas"
    private let db = Firestore.firestore()
    @Published var teas: [Tea] = []
    
    init() {
        loadAll()
    }
//
//    func addExpense(name: String, type: String, amount: String, date: Date, showInReport: String, userID: String, event: String) {
//        db.collection(collectionName).addDocument(data: [
//            "name": name,
//            "type": type,
//            "amount": amount,
//            "date": date,
//            "showInReport": showInReport,
//            "userID": userID,
//            "event": event
//        ])
//        loadAll()
//    }
//
//    func updateExpense(id: String, name: String, type: String, amount: String, date: Date, showInReport: String, userID: String, event: String) {
//        db.collection(collectionName).document(id).updateData([
//            "name": name,
//            "type": type,
//            "amount": amount,
//            "date": date,
//            "showInReport": showInReport,
//            "userID": userID,
//            "event": event
//        ]) { error in
//            print(error ?? "Update failed.")
//        }
//        loadAll()
////    }
//
//    func remove(at index: Int, date: Date, userID: String) {
//        let filteredUserID = expenses.filter {$0.userID == userID}
//        let formatterDayDigit = DateFormatter()
//        formatterDayDigit.dateFormat = "d"
//        let filteredDay = filteredUserID.filter { formatterDayDigit.string(from: $0.date) == formatterDayDigit.string(from: date)}
//        let expenseToDelete = filteredDay[index]
//        db.collection(collectionName).document(expenseToDelete.id).delete()
//        loadAll()
//    }
//
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

