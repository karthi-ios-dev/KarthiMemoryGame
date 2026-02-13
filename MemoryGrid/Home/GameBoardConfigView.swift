//
//  GameBoardConfigView.swift
//  MemoryGameByKarthik
//
//  Created by Codigo Technologies on 24/01/26.
//

import SwiftUI


struct GameBoardConfigView:View {
    
    @State var gameGridRow = 4
    @State var isMovetoGamePage:Bool = false
    @EnvironmentObject var navModel:NavigationModel
    var body: some View {
        
        NavigationStack(path: $navModel.path) {
           
            VStack(spacing: 15) {
                
                Image(ImageResource.logo)
                    .resizable()
                    .frame(width: 80,height: 80,alignment: .center)
                
                GameHeader()
                
                List {
                    
                    HStack {
                        
                        Text(AppStrings.gameCardCounts + "\(gameGridRow)")
                            .font(.subheadline)
                        
                        Stepper("", onIncrement: {
                            if gameGridRow < 8 {
                                gameGridRow += 1
                            }
                            
                        }, onDecrement: {
                            if gameGridRow > 4 {
                                gameGridRow -= 1
                                
                            }
                            
                        })
                        
                      
                      
                     
                        
                        
                    }
                    .listRowBackground(Color.clear)
                    
                }
                
                
                
                Button(action: {
                    AppConfig.boardRow = gameGridRow
                    AppConfig.boardColumn = gameGridRow
                    navModel.appendPath(string: "playGame")
                    
                }, label: {
                    
                    Label(title: {
                        Text("Start Game!")
                    }, icon: {
                        
                        Image(systemName: "play")
                            
                    })
                })
               
          
                
            }
           
            .navigationDestination(for: String.self, destination: { path in
                if path == "playGame" {
                    GameBoardView()
                }
            })
            .environmentObject(navModel)
        }
        
       
        
        
    }
    
    
    
    @ViewBuilder
    func GameHeader() -> some View {
        VStack(spacing: 10) {
         
            Text(AppStrings.gameHomeConfigTitle)
                .font(.headline)
            
            Text(AppStrings.gameHomeSubtitle)
                .font(.headline)
            
        }
        
    }
}
