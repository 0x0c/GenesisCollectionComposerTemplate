//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

struct SampleInteractorEntity {
    // TODO: Replace to specific entity
}

protocol SampleInteractorInput: ComposedViewFetchableInteractorInput where Entity == SampleInteractorEntity {
    // MARK: Methods called from presenter
}

protocol SampleInteractorOutput: AnyObject {
    // MARK: Callback methods for presenter
}

final class SampleInteractor {
    // MARK: VIPER property
    weak var presenter: (any SampleInteractorOutput)!
    private(set) var storage: SampleInteractorEntity?

    init() {}

    // MARK: Other private methods
}

extension SampleInteractor: SampleInteractorInput {}