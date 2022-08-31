//
//  Model.swift
//  MoviesList
//
//  Created by Константин Канюка on 31.08.2022.
//

import Foundation

struct ListCreationLogic {
    let title: String
    let year: Int
    var generatedModelList:[String]
    
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


