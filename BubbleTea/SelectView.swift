//
//  SelectView.swift
//  Pods
//
//  Created by Surapunya Thongdee on 1/6/2564 BE.
//

import SwiftUI

struct SelectView: View {
    @State var teas: [Tea]
    @State var teaFactory: TeaFactory
    @EnvironmentObject var toppingFactory: ToppingFactory
    @Binding var showSelectView: Bool
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(teas) { tea in
                        NavigationLink( destination: SelectToppingView(teaFactory: teaFactory, tea: tea, toppings: toppingFactory.toppings)){

                            HStack {
                                Text(tea.name)
                                Spacer()
                                Text("\(tea.price) ฿")
                                    .padding()
                            }
                            .padding()
                        }
                    }
                }
                Button(action: {
                    showSelectView.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                })
                
            }
            
            .navigationTitle("Order Your Tea")
        }
        
        
    }
}


struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView(teas: [], teaFactory: TeaFactory(), showSelectView: .constant(false))
            .environmentObject(TeaFactory())
            .environmentObject(ToppingFactory())
    }
}
