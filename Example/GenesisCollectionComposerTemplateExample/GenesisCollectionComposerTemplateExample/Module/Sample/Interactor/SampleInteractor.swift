//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/18.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

protocol SampleInteractorInput {
    // MARK: Methods called from presenter
}

protocol SampleInteractorOutput: ComposedViewInteractorOutput {
    // MARK: Callback methods for presenter
}

final class SampleInteractor {

    // MARK: VIPER property
    weak var presenter: (any SampleInteractorOutput)!

    init() {}

    // MARK: Other private methods
}

extension SampleInteractor: SampleInteractorInput {
}