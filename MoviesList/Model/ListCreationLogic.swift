//
//  Model.swift
//  MoviesList
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//

import Foundation

struct ListCreationLogic {
    
    //MARK: - Properties
    
    let title: String
    let year: Int
    var generatedModelList:[String]
    
    //MARK: - Methods
    
    private func mergeWords() -> String {
        return "\(title) \(String(year))"
    }
    
    mutating func generateList() {
        let merging = mergeWords()
        generatedModelList.append("\(merging)")
    }
}

//MARK: - Validation of duplicate

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}


