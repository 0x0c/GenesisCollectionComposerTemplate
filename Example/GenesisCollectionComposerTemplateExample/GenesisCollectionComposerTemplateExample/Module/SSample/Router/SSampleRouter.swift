//
//  SSampleRouter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import UIKit

@MainActor
protocol SSampleRouterInput: AnyObject {
    // MARK: View transitions
}

@MainActor
final class SSampleRouter {
    private unowned let viewController: SSampleViewController

    init(viewController: SSampleViewController) {
        self.viewController = viewController
    }

    static func assembleModule() -> SSampleViewController {
        let view = SSampleViewController()
        // TODO: Create a Storyboard with the same name as "SSample".
        // TODO: And Change "SSample" of "R.storyboard.SSample" to lowercase.
        // guard let view = R.storyboard.SSample.instantiateInitialViewController() else {
        //     fatalError("Fail to load SSampleViewController from Storyboard.")
        // }
        let interactor = SSampleInteractor()
        let router = SSampleRouter(viewController: view)
        let presenter = SSamplePresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }
}

extension SSampleRouter: SSampleRouterInput {}
