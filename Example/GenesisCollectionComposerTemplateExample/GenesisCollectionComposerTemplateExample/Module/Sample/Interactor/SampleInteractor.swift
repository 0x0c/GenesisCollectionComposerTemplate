//
//  SampleInteractor
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/11.
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
    func storeSections(_ sections: [any CollectionComposer.Section])
}

final class SampleInteractor {

    // MARK: VIPER property
    weak var presenter: (any SampleInteractorOutput)!

    init() {}

    // MARK: Other private methods
}

extension SampleInteractor: SampleInteractorInput {
    func makeSections() -> [any Section] {
        // TODO: Return array of CollectionComposer.Section to show on the view.
        return []
    }
}