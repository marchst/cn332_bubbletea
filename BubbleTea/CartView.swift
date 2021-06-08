//
//  CartView.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 18/5/2564 BE.
//

import SwiftUI

struct CartView: View {
    @State var teaFactory: TeaFactory
    @Binding var showCartView: Bool
    @State private var showingResultAlert = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(teaFactory.orders){ order in
                        HStack {
                            Text(order.name)
                            Spacer()
                            Text("\(order.price) ฿")
                                .padding()
                        }
                        .padding()
                    }
                    
                }
                Text(discountStrategy(price: teaFactory.allPrice(), orderCount: teaFactory.orders.count))
                
                HStack{
                    Spacer()
                    Button(action: {
                        showCartView.toggle()
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                    })
                    Spacer()

                    Button(action: {
                        showingResultAlert.toggle()
                        teaFactory.clearArray()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green)
                                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                               
                            Text("Order Now").bold()
                                .foregroundColor(.white)
                        }
                        
                    })
                    
                    .alert(isPresented: $showingResultAlert) {
                        Alert(title: Text("Success"), message: Text(""),
                              dismissButton: .cancel(Text("OK"))
                        )
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        teaFactory.clearArray()
                    }, label: {
                        Image(systemName: "trash.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                    })
                    Spacer()
                }
                
            }
            
            .navigationTitle("My Cart")
        }
        
        
    }
    func discountStrategy(price: String, orderCount: Int) -> String {
        var priceAfterDiscount = Int(price)!
        if orderCount > 3 {
            priceAfterDiscount = priceAfterDiscount - 10
            priceAfterDiscount = priceAfterDiscount - 20
            return "Discount for order over 50 ฿ : -10 ฿\nDiscount for order more than 3 order : -20 ฿\nTotal: \(priceAfterDiscount) ฿"
            
        } else if priceAfterDiscount >= 50 {
            priceAfterDiscount = priceAfterDiscount - 10
            return "Discount for order over 50 ฿ : -10 ฿\nTotal: \(priceAfterDiscount) ฿"
        } else {
            return "Total: \(priceAfterDiscount) ฿"
        }
        
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(teaFactory: TeaFactory(), showCartView: .constant(true))
            .environmentObject(TeaFactory())
    }
}
