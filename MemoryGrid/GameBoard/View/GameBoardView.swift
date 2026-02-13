//
//  GameBoardView.swift
//  MemoryGameByKarthik
//
//  Created by Codigo Technologies on 18/01/26.
//

import SwiftUI


struct GameBoardView:View {
    @StateObject var gameboardViewModal:GameBoardViewModel = GameBoardViewModel()
    var id = UUID()
    
    var body: some View {
        VStack(spacing: 10) {
            
            BuildScoreCard()
            
            Spacer()
                .frame(height: 25)
            HeaderTitle()
            
            Spacer()
            
            RectangleCard(gamegridData: $gameboardViewModal.gamegridData,onTap: {(rows,columns) in
                gameboardViewModal.changeGridStatus(row: rows, column: columns)
            } )
            
            Spacer()
            
        }
        .navigationDestination(isPresented: $gameboardViewModal.isGameCompleted, destination: {
            SuccessCelebratePage()
        })
      
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity,alignment: .center)
        .padding(.horizontal,15)
        
    }
    

    
    
//Mark: Score Card
    @ViewBuilder
    func BuildScoreCard() -> some View {
        
        HStack {
            
            Spacer()
            
            
            HStack {
                Group{
                    Image(systemName: "sportscourt.circle.fill")
                        .renderingMode(.template)
                        .tint(Color.white)
                    
                        .frame(height: 30)
                    
                    
                    Text(AppStrings.scoreCard.replacingOccurrences(of: "{0}", with: "\(gameboardViewModal.points)"))
                        .animation(.interactiveSpring,value: gameboardViewModal.points != 0)
                        .font(.body.bold())
                        .foregroundColor(Color.white)
                }
                .padding(8)
                
                
            }
            .background {
                Capsule()
                    .fill(Color.brown)
                
            }
            
            Spacer()
                .frame(width: 15)
            
            
        }
        
        
        
    }
    
    
    //Title
    @ViewBuilder
    func HeaderTitle() -> some View {
        
        VStack {
            
            Text(AppStrings.gameBoardHomeTitle)
                .font(.headline)
            Text(AppStrings.gameBoardHomeSubTitle)
                .font(.subheadline)
        }
    }
    
  
    
    
}



