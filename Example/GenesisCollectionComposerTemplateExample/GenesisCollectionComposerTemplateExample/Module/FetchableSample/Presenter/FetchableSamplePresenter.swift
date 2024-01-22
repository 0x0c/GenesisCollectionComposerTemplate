//
//  FetchableSamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/22.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Combine
import Foundation

enum FetchableSamplePresenterState {
    case initial
    case loading
    case fetched([ListItem])
    case failed(Error)
}

@MainActor
protocol FetchableSamplePresenterInput {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class FetchableSamplePresenter {
    // MARK: VIPER properties
    weak var view: (any FetchableSampleViewInput)!
    var interactor: (any FetchableSampleInteractorInput)!
    var router: (any FetchableSampleRouterInput)!

    @Published private var state: FetchableSamplePresenterState = .initial
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
        $state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newState in
                guard let self else {
                    return
                }
                view.updateSections(for: newState)
            }.store(in: &cancellable)
        fetch()
    }

    func fetch() {
        Task {
            state = .loading
            await interactor.fetch()
            guard let items = interactor.storage else {
                state = .failed(NSError(domain: "Failed to fetch", code: 0))
                return
            }
            state = .fetched(items)
        }
    }
}

extension FetchableSamplePresenter: FetchableSampleInteractorOutput {}
