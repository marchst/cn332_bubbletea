//
//  BubbleTeaFactory.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 13/5/2564 BE.
//

import SwiftUI

struct BubbleTeaFactory: View {
    @EnvironmentObject private var teaList: TeaList
    @EnvironmentObject private var toppingList: ToppingList
    @State var tea: String
    @State var topping: String
    var body: some View {
        NavigationView {
            VStack {
                Text("Confirm your menu")
                    .padding()
                Text(tea)
                    .padding()
                if topping != "-" {
                    Text("+ \(topping)")
                        .padding()
                }
                
                Text("Price: \(priceCalculator(tea: tea, topping: topping))")
            }
            
            
        }
        
    }
    
    func priceCalculator(tea: String, topping: String) -> (Int) {
        var price = 0
        if let foo = teaList.teas.first(where: {$0.name == tea}) {
            price = price + Int(foo.price)!
        } else {
            price = price + 0
        }
        if let foo = toppingList.toppings.first(where: {$0.name == topping}) {
            price = price + Int(foo.price)!
        } else {
            price = price + 0
        }
        return  price
    }
}

struct BubbleTeaFactory_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTeaFactory(tea: "", topping: "")
    }
}
