//
//  GameBoardViewModel.swift
//  MemoryGameByKarthik
//
//  Created by Codigo Technologies on 18/01/26.
//

import Foundation
import Combine
import SwiftUI

struct GameGrid {
    var symbol:String
    var isSelected = false
}

class GameBoardViewModel:ObservableObject {
    @Published var gamegridData = [[GameGrid]]()
    @Published var points:Int = 0
    var tappedValue:[IndexPath:String] = [:]
    @Published var isGameCompleted:Bool = false
    init() {
        initalizeGameBoardData()
    }
    
    
    //Setup Grid Value
    func initalizeGameBoardData() {
      
        var gameGrid = [[GameGrid]]()
        var rowData = [GameGrid]()
        var symbols = [String]()
        let totalCells = AppConfig.boardRow * AppConfig.boardColumn
        let half = totalCells / 2
        symbols += Array(repeating: AppConfig.rowSymbol, count: half)
        symbols += Array(repeating: AppConfig.columnSymbol, count: totalCells - half)
        symbols.shuffle()
        for  _ in 0..<AppConfig.boardColumn {
            for row in 0..<AppConfig.boardRow {
                
                rowData.append(GameGrid(symbol: symbols[row]))
            }
            
            gameGrid.append(rowData)
            rowData = []
        }
        
        
        gamegridData = gameGrid.shuffled()
    }
    
    //Change Grid Status
    func changeGridStatus(row:Int,column:Int) {
        
        gamegridData[column][row].isSelected.toggle()
        
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(0.5)) // 2 sec

               // 2. Save tapped value after showing
                
                    
            tappedValue[IndexPath(row: row, section: column),default: gamegridData[column][row].symbol] = gamegridData[column][row].symbol

               // 3. Process condition
               if tappedValue.count == AppConfig.totalTap {
                   doCondition()
               }

               // 4. Optional: hide again if needed
               // gamegridData[column][row].isSelected = false
           }
        
    }
    
    //Check All Game is Finished or not.
    func doCondition() {
        let values = Array(tappedValue.values)
        
        if values[0] != values[1]{
            tappedValue.forEach{
                gamegridData[$0.key.section][$0.key.row].isSelected = false
            }
            tappedValue.removeAll()

        }
        else if (points != AppConfig.boardRow * AppConfig.boardColumn){
            points += 2
            tappedValue.removeAll()
        }
        
        if points == AppConfig.boardRow * AppConfig.boardColumn {
            isGameCompleted.toggle()
        }
    }
  
    
    
}


class NavigationModel:ObservableObject {
    @Published var path:NavigationPath = NavigationPath()
    
    
    func appendPath(string:String) {
        path.append(string)
    }
    
    func removeAll() {
        
        withAnimation {
            path.removeLast()
        }
    }
    
}
