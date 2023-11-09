//
//  SSamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias SSamplePresenterInputInterface = ComposedViewPresenterInput

@MainActor
protocol SSamplePresenterInput: SSamplePresenterInputInterface, SectionDataSource {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class SSamplePresenter {
    // MARK: VIPER properties
    weak var view: SSampleViewInput!
    var interactor: SSampleInteractorInput!
    var router: SSampleRouterInput!

    private(set) var sections = [any CollectionComposer.Section]()

    init(view: SSampleViewInput, interactor: SSampleInteractorInput, router: SSampleRouterInput) {
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

extension SSamplePresenter: SSamplePresenterInput {
    func viewDidLoad() {
        // Do any additional setup after loading the view.
    }

    func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section) {
        // Handle item selection
    }

    func storeSections(_ sections: [any CollectionComposer.Section]) {
        store(sections)
    }}

extension SSamplePresenter: SSampleInteractorOutput {}
