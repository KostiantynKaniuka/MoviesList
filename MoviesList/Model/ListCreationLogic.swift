//
//  Model.swift
//  MoviesList
//
//  Created by Константин Канюка on 31.08.2022.
//

import Foundation

struct ListCreationLogic {
    
    //MARK: - Properties
    
    let title: String
    let year: Int
    var generatedModelList:[String]
    
    //MARK: - Methods
    
    private func mergingWords() -> String {
        let name = title
        let date = year
        return "\(name) \(String(date))"
    }
    
    mutating func generationOfList() {
        let merging = mergingWords()
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


