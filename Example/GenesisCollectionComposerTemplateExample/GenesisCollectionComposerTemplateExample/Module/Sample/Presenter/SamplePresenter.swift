//
//  SamplePresenter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import CollectionComposer
import CollectionComposerVIPERExtension
import Foundation

typealias SamplePresenterInputInterface = ComposedViewPresenterInput

@MainActor
protocol SamplePresenterInput: SamplePresenterInputInterface, SectionDataSource {
    // MARK: View Life-Cycle methods

    func viewDidLoad()

    // MARK: Other methods called from View
}

final class SamplePresenter {
    // MARK: VIPER properties
    weak var view: SampleViewInput!
    var interactor: SampleInteractorInput!
    var router: SampleRouterInput!

    private(set) var sections = [any CollectionComposer.Section]()

    init(view: SampleViewInput, interactor: SampleInteractorInput, router: SampleRouterInput) {
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

extension SamplePresenter: SamplePresenterInput {
    func viewDidLoad() {
        store(interactor.makeSections())
    }

    func didSelectItem(_ item: AnyHashable, in section: any CollectionComposer.Section, at indexPath: IndexPath) {
        // Handle item selection
        switch section {
        case is ListSection:
            guard let item = item as? ListItem else {
                return
            }
            print("List \(item.id)")
        default:
            break
        }
    }

    func storeSections(_ sections: [any CollectionComposer.Section]) {
        store(sections)
    }
}

extension SamplePresenter: SampleInteractorOutput {}
