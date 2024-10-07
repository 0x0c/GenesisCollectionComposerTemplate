//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

// MARK: - SampleInteractorEntity

struct SampleInteractorEntity {
    // TODO: Replace to specific entity
}

// MARK: - SampleInteractorInput

protocol SampleInteractorInput: ComposedViewFetchableInteractorInput where Entity == SampleInteractorEntity {
    // MARK: Methods called from presenter
}

// MARK: - SampleInteractorOutput

protocol SampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

// MARK: - SampleInteractor

final class SampleInteractor {
    // MARK: Lifecycle

    init() {}

    // MARK: Other private methods

    // MARK: Internal

    // MARK: VIPER property

    weak var presenter: (any SampleInteractorOutput)!
    private(set) var storage: SampleInteractorEntity?
}

// MARK: SampleInteractorInput

extension SampleInteractor: SampleInteractorInput {}
