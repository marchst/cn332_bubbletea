//
//  MenuView.swift
//  BubbleTea
//
//  Created by Surapunya Thongdee on 28/5/2564 BE.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("new menu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .navigationBarTitle("Menu",displayMode: .inline)
                Spacer()
                Button(action: {
                    showMenu.toggle()
                }, label:{
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        
                })
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(true))
    }
}
