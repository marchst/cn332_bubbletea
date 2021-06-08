//
//  HomeView.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 16/5/2564 BE.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var teaList: TeaList
    @State private var tea = ""
    @State private var topping = ""
    @State private var showTeaMenu = false
    @State private var showToppingMenu = false
    @State private var showCartView = false
    @State private var showMenu = false
    @State private var showSelectView = false
    
    var arrayOfTea = ["นมสด", "ชานม", "กาแฟ", "ชาไทย", "ชาเขียว", "ชานมเผือก"]
    @State private var selectedTeaIndex = 0
    var arrayOfTopping = ["-", "ไข่มุก", "เยลลี่ฟรุตตี้", "บราวชูการ์", "เฉาก๊วย", "ไข่มุกป๊อป"]
    @State private var selectedToppingIndex = 0
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
                    SelectView(teas: teaList.teas, showSelectView: $showSelectView)
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
                    CartView(showCartView: $showCartView)
                }
                .padding()
                
       
            }
            
            
            
            //            HStack {
            //                Text("เลือกน้ำ : ")
            //                Text(arrayOfTea[selectedTeaIndex])
            //                    .padding()
            //                    .onTapGesture {
            //                        showTeaMenu.toggle()
            //                    }
            //            }
            
            //            if showTeaMenu {
            //                Picker("", selection: $selectedTeaIndex) {
            //                    ForEach(0 ..< arrayOfTea.count) {
            //                        Text("\(self.arrayOfTea[$0])                                \(findPrice(teaName: self.arrayOfTea[$0]))")
            //                        //                                Text(findPrice(teaName: self.arrayOfTea[$0]))
            //
            //                    }
            //                }
            ////                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //                Button(action: {
            //                    showTeaMenu.toggle()
            //                }, label: {
            //                    Text("OK")
            //                })
            //                .padding()
            //            }
            //
            //            HStack {
            //                Text("เลือกท็อปปิ้ง : ")
            //                Text(arrayOfTopping[selectedToppingIndex])
            //                    .padding()
            //                    .onTapGesture {
            //                        showToppingMenu.toggle()
            //                    }
            //            }
            //
            //            if showToppingMenu {
            //                Picker("", selection: $selectedToppingIndex) {
            //                    ForEach(0 ..< arrayOfTopping.count) {
            //                        Text(self.arrayOfTopping[$0])
            //                    }
            //                }
            //                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //                Button(action: {
            //                    showToppingMenu.toggle()
            //                }, label: {
            //                    Text("OK")
            //                })
            //                .padding()
            //
            //
            //            }
            
            //            NavigationLink(destination: BubbleTeaFactory(tea: arrayOfTea[selectedTeaIndex], topping: arrayOfTopping[selectedToppingIndex])) {
            //                Image(systemName: "plus.circle.fill")
            //                    .resizable()
            //                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //            }
            
            
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
        if let _ = teaList.teas.first(where: {$0.name == teaName}) {
            let filteredName = teaList.teas.filter {$0.name == teaName }
            return filteredName[0].price
        } else {
            return ""
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TeaList())
    }
}
