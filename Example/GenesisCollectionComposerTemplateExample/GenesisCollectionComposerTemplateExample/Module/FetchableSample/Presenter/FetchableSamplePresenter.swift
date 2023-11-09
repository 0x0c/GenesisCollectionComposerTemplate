//
//  FetchableSamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/09.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias FetchableSamplePresenterInputInterface = ComposedViewFetchablePresenterInput

@MainActor
protocol FetchableSamplePresenterInput: FetchableSamplePresenterInputInterface, SectionDataSource {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class FetchableSamplePresenter {
    // MARK: VIPER properties
    weak var view: (any FetchableSampleViewInput)!
    var interactor: (any FetchableSampleInteractorInput)!
    var router: (any FetchableSampleRouterInput)!

    private(set) var sections = [any CollectionComposer.Section]()
    @Published var isLoading = false

    init(view: FetchableSampleViewInput, interactor: any FetchableSampleInteractorInput, router: FetchableSampleRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    @MainActor
    func store(_ sections: [any Section]) {
        self.sections = sections
        view?.updateSections(sections)
    }
}

extension FetchableSamplePresenter: FetchableSamplePresenterInput {
    var isLoadingPublisher: Published<Bool>.Publisher {
        return $isLoading
    }
    func viewDidLoad() {
        // Do any additional setup after loading the view.
    }

    func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section, at indexPath: IndexPath) {
        // Handle item selection
    }

    func storeSections(_ sections: [any CollectionComposer.Section]) {
        store(sections)
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
            isLoading = false
        }
    }
}

extension FetchableSamplePresenter: FetchableSampleInteractorOutput {}
