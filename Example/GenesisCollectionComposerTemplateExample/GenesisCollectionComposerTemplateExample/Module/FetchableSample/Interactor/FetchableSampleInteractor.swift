//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import Foundation

// MARK: - FetchableSampleInteractorInput

protocol FetchableSampleInteractorInput {
    // MARK: Methods called from presenter
}

// MARK: - FetchableSampleInteractorOutput

protocol FetchableSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

// MARK: - FetchableSampleInteractor

actor FetchableSampleInteractor {
    init() {}

    // MARK: Other private methods
}

// MARK: FetchableSampleInteractorInput

extension FetchableSampleInteractor: FetchableSampleInteractorInput {}
