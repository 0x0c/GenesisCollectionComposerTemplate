//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias SampleInteractorInputInterface = ComposedViewInteractorInput

protocol SampleInteractorInput: SampleInteractorInputInterface {
    // MARK: Methods called from presenter
}

protocol SampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

final class SampleInteractor {

    // MARK: VIPER property
    weak var presenter: SampleInteractorOutput!

    init() {}

    // MARK: Other private methods
}

extension SampleInteractor: SampleInteractorInput {
    func makeSections() -> [any Section] {
        return [
            ListSection(id: "first", apperarance: .plain) {
                ListItem(text: "Item 1")
                ListItem(text: "Item 2")
                ListItem(text: "Item 3")
                ListItem(text: "Item 4")
                ListItem(text: "Item 5")
            }.header(.plain("Header"))
                .footer(.plain("Footer")),
            ListSection(id: "second", apperarance: .insetGrouped) {
                ListItem(text: "Item 1", secondaryText: "Seconday")
                ListItem(text: "Item 2", secondaryText: "Seconday")
                ListItem(text: "Item 3", secondaryText: "Seconday")
                ListItem(text: "Item 4", secondaryText: "Seconday")
                ListItem(text: "Item 5", secondaryText: "Seconday")
            }.header(.plain("Expandable Header", isExpandable: true))
                .footer(.plain("Footer"))
        ]
    }
}
