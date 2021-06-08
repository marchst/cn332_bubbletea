//
//  Order.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 7/6/2564 BE.
//

import Foundation

struct Order: Identifiable {
    var id = UUID()
    var name: String
    var price: String
}
