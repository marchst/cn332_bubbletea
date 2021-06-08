//
//  HomeView.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 16/5/2564 BE.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var teaFactory: TeaFactory
    @State private var tea = ""
    @State private var topping = ""
    @State private var showTeaMenu = false
    @State private var showToppingMenu = false
    @State private var showCartView = false
    @State private var showMenu = false
    @State private var showSelectView = false
    
    var body: some View {
        VStack {
            Image("logo2")
                .resizable()
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack {
                Button(action: {
                    showSelectView.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.purple)
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                    }
                    
                    
                })
                .sheet(isPresented: $showSelectView) {
                    SelectView(teas: teaFactory.teas, teaFactory: teaFactory, showSelectView: $showSelectView)
                }
                .padding()
                
                Button(action: {
                    showMenu.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.purple)
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                    }
                    
                })
                .sheet(isPresented: $showMenu) {
                    MenuView(showMenu: $showMenu)
                }
       
   
                
                Button(action: {
                    showCartView.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.purple)
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                    }
                    
                    
                })
                .sheet(isPresented: $showCartView) {
                    CartView(teaFactory: teaFactory,showCartView: $showCartView)
                }
                .padding()
                
       
            }
            
            
            
            .padding()
        }
        .animation(.default)
        
        .navigationBarTitle("Bubble Tea",displayMode: .inline)
        
        .background(Image("wall")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        
    }
    func findPrice (teaName: String) -> String {
        if let _ = teaFactory.teas.first(where: {$0.name == teaName}) {
            let filteredName = teaFactory.teas.filter {$0.name == teaName }
            return filteredName[0].price
        } else {
            return ""
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TeaFactory())
    }
}
