//
//  GameSuccessView.swift
//  MemoryGrid
//
//  Created by Codigo Technologies on 12/02/26.
//

import SwiftUI


struct SuccessCelebratePage:View {
    @EnvironmentObject var navigationPath:NavigationModel
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("🏆")
                .font(.system(size: 30))
            
            Text("Hurray!!! You are Completed the All the Grid")
            
            
            
            Button(action: {
                navigationPath.removeAll()
            }, label: {
                HStack(spacing: 10) {
                    
                    Image(systemName: "house")
                        .resizable()
                        .renderingMode(.template)
                        .tint(Color.white)
                       
                      
                    
                    Text("Make a Another game!!")
                        .font(.footnote)
                        
                    
                }
                .padding()
            })
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
            }
            .buttonStyle(.plain)
            
        }
        
        
    }
}
