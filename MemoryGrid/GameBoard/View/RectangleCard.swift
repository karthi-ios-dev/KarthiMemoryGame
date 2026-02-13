
//
//  RectangleCar.swift
//  MemoryGameByKarthik
//
//  Created by Codigo Technologies on 24/01/26.
//

import SwiftUI


struct RectangleCard:View {
    @Binding var gamegridData:[[GameGrid]]
    var onTap:(_ row:Int,_ column:Int)->()?
  
    let spacing:CGFloat = 8
    var body: some View {
     
        GeometryReader { geo in
            
            let column = gamegridData.first?.count ?? 0
            let totalSpacing =  spacing * CGFloat(column - 1)
            let cellSize = (geo.size.width - CGFloat(totalSpacing)) / CGFloat(column)
            
            
            Grid(horizontalSpacing: spacing,verticalSpacing: spacing) {
                
                ForEach(0..<gamegridData.count,id: \.self, content: { column in
                    
                    //Mark Grid Row Based showing
                    GridRow(content: {
                 
                        ForEach(0..<gamegridData[column].count,id:  \.self) { rows in
                            BuildGameGridRow(grid: gamegridData[column][rows])
                                .frame(width: cellSize, height: cellSize)
                                .background{
                                    
                                    
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color.red)
                                    
                                    
                                        .shadow(color: Color.black.opacity(0.3),radius: 8)
                                    
                                    
                                    
                                }
                            
                               
                                .overlay {
                                  
                                    if !gamegridData[column][rows].isSelected {
                                      
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(Color.blue)
                                         
                                            .onTapGesture {
                                                withAnimation{
                                                    onTap(rows,column)
                                                }
                                            }
                                    }
                                }
                            
                            
                        }
                        
                    })
                    
                    
                    
                })
            
        }
            .frame(width: geo.size.width)
            
          
      
        }
     
        /*
         
         */
        //        ForEach(0..<gamegridData.count,id: \.self, content: { column in
        //
        //            HStack(spacing: 8) {
        //                ForEach(0..<gamegridData[column].count,id:  \.self) { rows in
        //
        //                    BuildGameGridRow(grid: gamegridData[column][rows])
        //
        //
        //                        .background{
        //
        //
        //                            RoundedRectangle(cornerRadius: 10, style: .continuous)
        //                                .fill(Color.red)
        //                                .frame(width: 70, height: 70)
        //
        //                                .shadow(color: Color.black.opacity(0.3),radius: 8)
        //
        //
        //
        //                        }
        //
        //                        .padding()
        //                        .overlay {
        //                            if !gamegridData[column][rows].isSelected {
        //                                RoundedRectangle(cornerRadius: 10, style: .continuous)
        //                                    .fill(Color.blue)
        //                                    .frame(width: 70, height: 70)
        //                                    .onTapGesture {
        //                                        withAnimation{
        //                                            onTap(rows,column)
        //                                        }
        //                                    }
        //                            }
        //                        }
        //
        //                }
        //            }
        
        //.animation(Animation.interactiveSpring, value: !gamegridData.isEmpty)
        
        //})
    }
    
}

@ViewBuilder
func BuildGameGridRow(grid:GameGrid) -> some View {
    
    VStack {
        Text(grid.symbol)
        .font(.title)
        
    }
   
    
    
}
