//
//  SamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/19.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

enum SamplePresenterState {
    case initial(_ items: [ListItem])
}

@MainActor
protocol SamplePresenterInput {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class SamplePresenter {
    // MARK: VIPER properties
    weak var view: (any SampleViewInput)!
    var interactor: (any SampleInteractorInput)!
    var router: (any SampleRouterInput)!


    init(view: SampleViewInput, interactor: any SampleInteractorInput, router: SampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SamplePresenter: SamplePresenterInput {
    func viewDidLoad() {
        // Do any additional setup after loading the view.
        view.updateSections(for: makeState())
    }

    private func makeState() -> SamplePresenterState {
        return .initial([ListItem].mock())
    }
}

extension SamplePresenter: SampleInteractorOutput {}
