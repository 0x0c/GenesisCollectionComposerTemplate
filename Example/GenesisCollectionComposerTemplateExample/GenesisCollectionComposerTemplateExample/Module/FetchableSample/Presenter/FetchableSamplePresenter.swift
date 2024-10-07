//
//  FetchableSamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Combine
import Foundation

// MARK: - FetchableSamplePresenterState

enum FetchableSamplePresenterState {
    // TODO: Add any states for view
    case initial
}

// MARK: - FetchableSamplePresenterInput

@MainActor
protocol FetchableSamplePresenterInput {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

// MARK: - FetchableSamplePresenter

@MainActor
final class FetchableSamplePresenter {
    // MARK: Lifecycle

    init(view: FetchableSampleViewInput, interactor: any FetchableSampleInteractorInput, router: FetchableSampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: Internal

    // MARK: VIPER properties

    weak var view: (any FetchableSampleViewInput)!
    var interactor: (any FetchableSampleInteractorInput)!
    var router: (any FetchableSampleRouterInput)!

    // MARK: Private

    @Published private var state: FetchableSamplePresenterState = .initial
    private var cancellable = Set<AnyCancellable>()
}

// MARK: FetchableSamplePresenterInput

extension FetchableSamplePresenter: FetchableSamplePresenterInput {
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

// MARK: FetchableSampleInteractorOutput

extension FetchableSamplePresenter: FetchableSampleInteractorOutput {}
