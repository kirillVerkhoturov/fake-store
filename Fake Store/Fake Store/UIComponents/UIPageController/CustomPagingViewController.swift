//
//  CustomPagingViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/12/22.
//

import UIKit
import SnapKit

class CustomPagingViewController: UIPageViewController {

    // MARK: - Public Properties

    var onButtonDidTap: (() -> Void)?

    // MARK: - Private Properties

    private var controllers: [UIViewController] = []
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = AppColor.primaryBlack40
        pageControl.currentPageIndicatorTintColor = AppColor.primaryWhite

        return pageControl
    }()
    private var pageContent: [PageContent] = []

    // MARK: - Initializers

    init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil, content: [PageContent]) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        self.pageContent = content
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self

        setupControllers()
        setupLayout()
    }

    // MARK: - Private Methods

    private func setupControllers() {
        if pageContent.isEmpty {
            let emptyVC = PageContentViewController(content: PageContent(title: "NO Content", body: "NO Content", buttonTitle: "Noooo"))
            controllers.append(emptyVC)
            disablePaging()
        } else {
            pageContent.forEach { page in
                let contentVC = PageContentViewController(content: PageContent(title: page.title, body: page.body, buttonTitle: page.buttonTitle))
                contentVC.onButtonDidTap = { [unowned self] in
                    self.onButtonDidTap?()
                }
                controllers.append(contentVC)
            }
        }
        setPageController()
    }

    private func disablePaging() {
        dataSource = nil
        delegate = nil
    }

    private func setPageController() {
        if let initialVC = controllers.first {
            setViewControllers([initialVC], direction: .forward, animated: false, completion: nil)
        }
        pageControl.numberOfPages = controllers.count
    }

    private func setupLayout() {
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(164).priority(.low)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-24)
        }
    }

}

extension CustomPagingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    // MARK: UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return controllers.last }
        guard controllers.count > previousIndex else { return nil }
        return controllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < controllers.count else { return controllers.first }
        guard controllers.count > nextIndex else { return nil }
        return controllers[nextIndex]
    }

    // MARK: UIPageViewControllerDelegate

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pageControl.currentPage = getIndex(of: pendingViewControllers.first, in: controllers)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            pageControl.currentPage = getIndex(of: previousViewControllers.first, in: controllers)
        }
    }
    
}
