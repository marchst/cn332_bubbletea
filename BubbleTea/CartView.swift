//
//  CartView.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 18/5/2564 BE.
//

import SwiftUI

struct CartView: View {
    @Binding var showCartView: Bool
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Image(systemName: "minus.circle.fill")
                        Text("1")
                            .padding(.leading)
                            .padding(.trailing)
                        Image(systemName: "plus.circle.fill")
                        
                        Text("500")
                            .padding()
                    }
                    .padding()
                    
                }
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
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green)
                                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                               
                            Text("Order Now").bold()
                                .foregroundColor(.white)
                        }
                        
                    })
                    .padding()
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
}

struct A: Identifiable {
    let id: String
    let c: Tea
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(showCartView: .constant(true))
    }
}
