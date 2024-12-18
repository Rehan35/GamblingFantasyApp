//
//  NBAPlayers.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/17/24.
//

import SwiftUI
import Foundation

class Teams: ObservableObject {
    static let shared = Teams()
    
    @Published var teamsNicknameMap: [String:String] = [:]
    
    @MainActor
    func fetchAllTeamNames() {
        let fileContents = Players.readCSV(fileName: "TeamNicknames")
        if var fileContents = fileContents {
            fileContents.remove(at: 0)
            for content in fileContents {
                let name = content[0]
                let nickname = content[1].replacingOccurrences(of: "\r", with: "")
                print(name)
                DispatchQueue.main.async {
                    self.teamsNicknameMap[name] = nickname
                }
            }
        }
        
    }
    
    func fetchImage(from urlString: String) async -> UIImage? {
        // Validate URL
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return nil
        }

        do {
            // Fetch image data asynchronously
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Convert data to UIImage
            return UIImage(data: data)
        } catch {
            print("Error fetching image: \(error)")
            return nil
        }
    }
}

class Players: ObservableObject {
    
    static let shared = Players()
    @Published var playersImageMap: [String:UIImage] = [:]
    
    static func readCSV(fileName: String) -> [[String]]? {
        // Locate the file in the app bundle
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "csv") else {
            print("File not found")
            return nil
        }
        
        do {
            // Load the file contents as a single string
            let contents = try String(contentsOf: filePath, encoding: .utf8)
            
            // Split the contents into rows
            let rows = contents.components(separatedBy: "\n").filter { !$0.isEmpty }
            
            // Split each row into columns
            let csvData = rows.map { $0.components(separatedBy: ",") }
            
            return csvData
        } catch {
            print("Error reading file: \(error)")
            return nil
        }
    }
    
    @MainActor
    func fetchAllPlayers() async {
        let fileContents = Players.readCSV(fileName: "NBAPlayers")
        if var fileContents = fileContents {
            fileContents.remove(at: 0)
            for content in fileContents {
                let name = content[0]
                let link = content[1].replacingOccurrences(of: "\r", with: "")
                if let image = await fetchImage(from: link) {
                    DispatchQueue.main.async {
                        self.playersImageMap[name] = image
                    }
                }
            }
        }
        
    }
    
    func fetchImage(from urlString: String) async -> UIImage? {
        // Validate URL
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return nil
        }

        do {
            // Fetch image data asynchronously
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Convert data to UIImage
            return UIImage(data: data)
        } catch {
            print("Error fetching image: \(error)")
            return nil
        }
    }
}
