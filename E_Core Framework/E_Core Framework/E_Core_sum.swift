//
//  E_Core_sum.swift
//  E_Core Framework
//
//  Created by Menna Allah on 07/02/2024.
//

import Foundation
public class E_Core_sum {
    public static func sum(numbers: [Int]) -> Int {
        return numbers.reduce(0, +)
    }
}

