//
//  FetchableSampleRouter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/01/22.
//

import UIKit

@MainActor
protocol FetchableSampleRouterInput: AnyObject {
    // MARK: View transitions
}

@MainActor
final class FetchableSampleRouter {
    private unowned let viewController: FetchableSampleViewController

    init(viewController: FetchableSampleViewController) {
        self.viewController = viewController
    }

    static func assembleModule() -> FetchableSampleViewController {
        let view = FetchableSampleViewController()
        // TODO: Create a Storyboard with the same name as "FetchableSample".
        // TODO: And Change "FetchableSample" of "R.storyboard.FetchableSample" to lowercase.
        // guard let view = R.storyboard.FetchableSample.instantiateInitialViewController() else {
        //     fatalError("Fail to load FetchableSampleViewController from Storyboard.")
        // }
        let interactor = FetchableSampleInteractor()
        let router = FetchableSampleRouter(viewController: view)
        let presenter = FetchableSamplePresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }
}

extension FetchableSampleRouter: FetchableSampleRouterInput {}
