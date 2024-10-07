//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import Foundation

protocol SampleInteractorInput {
    // MARK: Methods called from presenter
}

protocol SampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

actor SampleInteractor {
    init() {}

    // MARK: Other private methods
}

extension SampleInteractor: SampleInteractorInput {}