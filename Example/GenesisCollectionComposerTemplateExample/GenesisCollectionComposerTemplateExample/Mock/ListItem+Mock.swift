//
//  ListItem+Mock.swift
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/19.
//

import Foundation

extension [ListItem] {
    static func mock() -> [ListItem] {
        return [
            ListItem(text: "item 1"),
            ListItem(text: "item 2"),
            ListItem(text: "item 3")
        ]
    }
}
