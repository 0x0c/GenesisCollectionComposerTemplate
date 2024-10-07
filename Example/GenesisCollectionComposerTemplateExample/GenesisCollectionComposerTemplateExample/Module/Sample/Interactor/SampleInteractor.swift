//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import Foundation

// MARK: - SampleInteractorInput

protocol SampleInteractorInput {
    // MARK: Methods called from presenter
}

// MARK: - SampleInteractorOutput

protocol SampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

// MARK: - SampleInteractor

actor SampleInteractor {
    init() {}

    // MARK: Other private methods
}

// MARK: SampleInteractorInput

extension SampleInteractor: SampleInteractorInput {}
