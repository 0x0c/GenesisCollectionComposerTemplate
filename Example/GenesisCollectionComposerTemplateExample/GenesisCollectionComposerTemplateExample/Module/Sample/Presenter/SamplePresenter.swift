//
//  SamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Combine
import Foundation

// MARK: - SamplePresenterState

enum SamplePresenterState {
    // TODO: Add any states for view
    case initial
}

// MARK: - SamplePresenterInput

@MainActor
protocol SamplePresenterInput {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

// MARK: - SamplePresenter

@MainActor
final class SamplePresenter {
    // MARK: Lifecycle

    init(view: SampleViewInput, interactor: any SampleInteractorInput, router: SampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: Internal

    // MARK: VIPER properties

    weak var view: (any SampleViewInput)!
    var interactor: (any SampleInteractorInput)!
    var router: (any SampleRouterInput)!

    // MARK: Private

    @Published private var state: SamplePresenterState = .initial
    private var cancellable = Set<AnyCancellable>()
}

// MARK: SamplePresenterInput

extension SamplePresenter: SamplePresenterInput {
    func viewDidLoad() {
        // Do any additional setup after loading the view.
        view.updateSections(for: state)
        $state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newState in
                guard let self else {
                    return
                }
                view.updateSections(for: newState)
            }.store(in: &cancellable)
        // TODO: Fetch data from interactor
    }
}

// MARK: SampleInteractorOutput

extension SamplePresenter: SampleInteractorOutput {}
