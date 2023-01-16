//
//  Collection + Extension.swift
//  NewApp
//
//  Created by Кристина Баскакова on 29.12.2022.
//

import Foundation

extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
