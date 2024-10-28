//
//  CustomTabBarController.swift
//  Movies
//
//  Created by Sphoorti M Patil on 25/10/24.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    private let tabBarView = UIView()
    private let tabBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TabBarCollectionViewCell.self, forCellWithReuseIdentifier: "TabBarCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = CustomColor.tabBarBackgroundColor
        return collectionView
    }()

    var navVC: UINavigationController?
    lazy var homeVC = HomeViewController()
    lazy var collectionVC = CollectionViewController()
    lazy var profileVC = ProfileViewController()
    
    enum TabBarOptions: String, CaseIterable {
        case collection = "Collection"
        case home = "Home"
        case profile = "Profile"
        
        var imageName: String {
            switch self {
            case .home:
                return Constants.Icons.home
            case .collection:
                return Constants.Icons.tag
            case .profile:
                return  Constants.Icons.profile
            }
        }
    }
    private var currentTabSelection: TabBarOptions = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CustomColor.backgroundColor
        changeDefaultTabBarAppearace()
        configureTabBarView()
        configureTabBarCollectionView()
        addChildViewControllers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func changeDefaultTabBarAppearace() {
        super.tabBar.isTranslucent = false
        super.tabBar.barTintColor = CustomColor.backgroundColor
        super.tabBar.tintColor = .label
        super.tabBar.shadowImage = UIImage()
        super.tabBar.backgroundImage = UIImage()
    }
    
    private func configureTabBarView() {
        view.addSubview(tabBarView)
               
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tabBarView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tabBarView.backgroundColor = CustomColor.tabBarBackgroundColor
        tabBarView.clipsToBounds = true
        tabBarView.layer.cornerRadius = 35
    }
    
    private func configureTabBarCollectionView() {
        tabBarView.addSubview(tabBarCollectionView)
        
        tabBarCollectionView.topAnchor.constraint(equalTo: tabBarView.topAnchor).isActive = true
        tabBarCollectionView.leadingAnchor.constraint(equalTo: tabBarView.leadingAnchor, constant: 20).isActive = true
        tabBarCollectionView.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor, constant: -20).isActive = true
        tabBarCollectionView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor).isActive = true
        
        tabBarCollectionView.dataSource = self
        tabBarCollectionView.delegate = self
    }
    
    private func addChildViewControllers() {
        let navigationController = UINavigationController(rootViewController: homeVC)
        addChild(navigationController)
        view.addSubview(navigationController.view)
        navigationController.didMove(toParent: self)
        self.navVC = navigationController
    }
}


extension CustomTabBarController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currentSelectedIndex = TabBarOptions.allCases.firstIndex(of: currentTabSelection),
              let currentSelectedCell = collectionView.cellForItem(at: IndexPath(item: currentSelectedIndex, section: 0)) as? TabBarCollectionViewCell,
              let updatedSelectedCell = collectionView.cellForItem(at: indexPath) as? TabBarCollectionViewCell else {
            return
        }
        currentSelectedCell.animateTabItem(isSelected: false)
        updatedSelectedCell.animateTabItem(isSelected: true)


        let tabItem = TabBarOptions.allCases[indexPath.row]
        switch tabItem {
        case .home:
            self.resetToHome()
        case .collection:
            self.resetToHome()
            self.openVC(vc: collectionVC, from: .collection)
        case .profile:
            self.resetToHome()
            self.openVC(vc: profileVC, from: .profile)
        }
    }
    
    func openVC(vc: UIViewController, from selectedOption: TabBarOptions) {
        if currentTabSelection == selectedOption {
            return
        }
        let vc = vc
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        currentTabSelection = selectedOption
    }
    
    func resetToHome() {
        switch currentTabSelection {
        case .collection:
            collectionVC.view.removeFromSuperview()
            collectionVC.didMove(toParent: nil)
        case .home:
            return
        case .profile:
            profileVC.view.removeFromSuperview()
            profileVC.didMove(toParent: nil)
        }
        currentTabSelection = .home
    }
}

extension CustomTabBarController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TabBarOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "TabBarCell", for: indexPath) as? TabBarCollectionViewCell else { return UICollectionViewCell(frame: .zero)}
        let option = TabBarOptions.allCases[indexPath.row]
        cell.setTabItems(label: option.rawValue, imageName: option.imageName)
        if option == .home {
            cell.animateTabItem(isSelected: true)
        }
        return cell
    }
}

extension CustomTabBarController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout , sizeForItemAt indexPath: IndexPath)->CGSize {
        let tabItemCount = CGFloat(TabBarOptions.allCases.count)
        let itemSize = (tabBarCollectionView.frame.width - (tabBarCollectionView.contentInset.left + tabBarCollectionView.contentInset.right + 5) ) / tabItemCount
        return CGSize(width: itemSize, height: tabBarCollectionView.frame.height)
    }
}
