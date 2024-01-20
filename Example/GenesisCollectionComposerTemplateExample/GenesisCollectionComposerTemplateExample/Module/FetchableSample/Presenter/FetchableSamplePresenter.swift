//
//  FetchableSamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/19.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

enum FetchableSamplePresenterState {
    // TODO: Add any states for view
    case loading
    case fetched(_ items: [ListItem])
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

    @Published var isLoading = false

    init(view: FetchableSampleViewInput, interactor: any FetchableSampleInteractorInput, router: FetchableSampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FetchableSamplePresenter: FetchableSamplePresenterInput {
    var isLoadingPublisher: Published<Bool>.Publisher {
        return $isLoading
    }

    func viewDidLoad() {
        // Do any additional setup after loading the view.
        view.updateSections(for: makeState())
        fetch(force: true)
    }

    private func makeState() -> FetchableSamplePresenterState {
        guard let items = interactor.storage else {
            return .loading
        }
        return .fetched(items)
    }

    func fetch(force: Bool) {
        Task { [weak view] in
            isLoading = true
            do {
                try await interactor.fetch(force: force)
            }
            catch {
                // TODO: handle error
            }
            view?.updateSections(for: makeState())
            isLoading = false
        }
    }
}

extension FetchableSamplePresenter: FetchableSampleInteractorOutput {}
