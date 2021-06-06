//
//  SelectView.swift
//  Pods
//
//  Created by Surapunya Thongdee on 6/6/2564 BE.
//

import SwiftUI

struct SelectView: View {
    @EnvironmentObject var teaList: TeaList
    @Binding var showSelectView: Bool
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(teaList.teas) { tea in
                        HStack {
                            Text(tea.name)
                            Spacer()
//                            Image(systemName: "minus.circle.fill")
//                            Text("1")
//                                .padding(.leading)
//                                .padding(.trailing)
//                            Image(systemName: "plus.circle.fill")
                            
                            Text("\(tea.price) ฿")
                                .padding()
                        }
                        .padding()
                    }
                }
                HStack{
                    Spacer()
                    Button(action: {
                        showSelectView.toggle()
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
            
            .navigationTitle("Order Your Tea")
        }
        
        
    }
}


struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView(showSelectView: .constant(false))
            .environmentObject(TeaList())
    }
}
