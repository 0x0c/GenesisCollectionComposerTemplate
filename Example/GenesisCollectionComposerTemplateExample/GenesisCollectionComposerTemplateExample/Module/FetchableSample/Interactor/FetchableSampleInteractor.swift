//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

// MARK: - FetchableSampleInteractorEntity

struct FetchableSampleInteractorEntity {
    // TODO: Replace to specific entity
}

// MARK: - FetchableSampleInteractorInput

protocol FetchableSampleInteractorInput: ComposedViewFetchableInteractorInput where Entity == FetchableSampleInteractorEntity {
    // MARK: Methods called from presenter
}

// MARK: - FetchableSampleInteractorOutput

protocol FetchableSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

// MARK: - FetchableSampleInteractor

final class FetchableSampleInteractor {
    // MARK: Lifecycle

    init() {}

    // MARK: Other private methods

    // MARK: Internal

    // MARK: VIPER property

    weak var presenter: (any FetchableSampleInteractorOutput)!
    private(set) var storage: FetchableSampleInteractorEntity?
}

// MARK: FetchableSampleInteractorInput

extension FetchableSampleInteractor: FetchableSampleInteractorInput {}
