//
//  SelectToppingView.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 7/6/2564 BE.
//

import SwiftUI

struct SelectToppingView: View {
    @State var teaList: TeaList
    @State var tea: Tea
    @State var toppings: [Topping]
    @State var selection: Topping?
    var body: some View {
        ScrollView {
            
            ForEach(toppings) { topping in
                HStack {
                    Text(topping.name)
                    Spacer()
                    Text("\(topping.price) ฿")
                        .padding()
                    Image(systemName: selection == topping ? "checkmark.circle" : "circle")
                }
                .onTapGesture {
                    selection = topping
                    print(selection)
                    
                }
                .padding()
                .padding(.leading)
                .padding(.trailing)
                
                
            }
            .navigationBarTitle(tea.name,displayMode: .inline)
            
            HStack{
                Button(action: {
                    let tuple = orderFactory(tea: tea.name, topping: selection!.name, p1: tea.price, p2: selection!.price)
                    teaList.addToArray(name: tuple.0, price: tuple.1)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.green)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text("Order Now").bold()
                            .foregroundColor(.white)
                    }
                    
                })
                
            }
        }
    }
    func orderFactory (tea: String,topping: String,p1:String,p2:String) -> (String,String) {
        let n = "\(tea) + \(topping)"
        let p = Int(p1)! + Int(p2)!
        return (n,"\(p)")
    }
}

//struct SelectToppingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectToppingView(teaList: <#TeaList#>, tea:Tea(id: "", name: "", price: ""), toppings: [])
//    }
//}
