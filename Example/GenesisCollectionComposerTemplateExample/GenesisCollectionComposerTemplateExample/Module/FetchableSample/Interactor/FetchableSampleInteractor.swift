//
//  FetchableSampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import Foundation

protocol FetchableSampleInteractorInput {
    // MARK: Methods called from presenter
}

protocol FetchableSampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

actor FetchableSampleInteractor {
    init() {}

    // MARK: Other private methods
}

extension FetchableSampleInteractor: FetchableSampleInteractorInput {}