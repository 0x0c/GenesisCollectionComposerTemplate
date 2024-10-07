//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

struct FetchableSampleInteractorEntity {
    // TODO: Replace to specific entity
}

protocol FetchableSampleInteractorInput: ComposedViewFetchableInteractorInput where Entity == FetchableSampleInteractorEntity {
    // MARK: Methods called from presenter
}

protocol FetchableSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

final class FetchableSampleInteractor {
    // MARK: VIPER property
    weak var presenter: (any FetchableSampleInteractorOutput)!
    private(set) var storage: FetchableSampleInteractorEntity?

    init() {}

    // MARK: Other private methods
}

extension FetchableSampleInteractor: FetchableSampleInteractorInput {}