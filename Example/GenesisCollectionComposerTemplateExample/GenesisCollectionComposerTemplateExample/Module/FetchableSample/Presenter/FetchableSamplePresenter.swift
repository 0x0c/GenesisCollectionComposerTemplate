//
//  FetchableSamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/20.
//

import Combine
import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

enum FetchableSamplePresenterState {
    case loading
    case fetched([ListItem])
    case failed(Error)
}

@MainActor
protocol FetchableSamplePresenterInput: ComposedViewFetchablePresenterInput {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class FetchableSamplePresenter {
    // MARK: VIPER properties
    weak var view: (any FetchableSampleViewInput)!
    var interactor: (any FetchableSampleInteractorInput)!
    var router: (any FetchableSampleRouterInput)!

    @Published private var state: FetchableSamplePresenterState = .loading
    private var cancellable = Set<AnyCancellable>()

    init(view: FetchableSampleViewInput, interactor: any FetchableSampleInteractorInput, router: FetchableSampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FetchableSamplePresenter: FetchableSamplePresenterInput {
    func viewDidLoad() {
        // Do any additional setup after loading the view.
        view.updateSections(for: state)
        $state.sink { [weak self] newState in
            guard let self else {
                return
            }
            view.updateSections(for: newState)
        }.store(in: &cancellable)
        fetch(force: true)
    }

    func fetch(force: Bool) {
        Task {
            do {
                try await interactor.fetch(force: force)
                guard let items = interactor.storage else {
                    state = .failed(NSError(domain: "Failed to fetch", code: 0))
                    return
                }
                state = .fetched(items)
            }
            catch {
                // TODO: Handle error
            }
        }
    }
}

extension FetchableSamplePresenter: FetchableSampleInteractorOutput {}
