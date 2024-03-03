//
//  TreeVC.swift
//  E_iPhone
//
//  Created by Alaa Eid on 25/02/2023.
//

import UIKit
import Combine


enum Section {
  case main
}

public class TreeVC: UIViewController {

    public  init() {
        super.init(nibName: "TreeVC", bundle: Bundle(for: TreeVC.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    @IBOutlet weak var treeCollectionView: UICollectionView!
    
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Tree>
    private typealias Snapshot = NSDiffableDataSourceSectionSnapshot<Tree>
    

    private var snapshot = Snapshot()

    var cellreg = UICollectionView.CellRegistration<StructCell, Tree> { cell, indexPath, itemIdentifier in}
    private lazy var dataSource = makeDataSource(cellRegistration: cellreg)
    
    var expandedSections: Set<Tree> = []


    var tree = Tree.getRoot()

    //MARK: - lifeCycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        
        DispatchQueue.main.async {
            self.applyRootSnapshot(with: self.tree)
            
        }
         cellreg = UICollectionView.CellRegistration<StructCell, Tree>() { cell, indexPath, item in

             let isExpanded =  self.expandedSections.contains(item)

             cell.configure(with: item)
           
             let hasChilds = (item.childnodecount != 0)
             cell.configureRoot(hasChilds: hasChilds, isExpanded: isExpanded)
            
             let childLevel = self.snapshot.level(of: item)
             cell.set(indentationConstraint: CGFloat(20 * childLevel))


       }
        

    }


}


//MARK: - UICollectionViewDelegate
extension TreeVC: UICollectionViewDelegate {
 
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let snapOFIndex = dataSource.itemIdentifier(for: indexPath) else {return}

        
        if !selectedSnapshotHasChilds(indexPath: indexPath) {
        
            let childs = Tree.getChild(structID: snapOFIndex.structID)
            applyChildsSnapshot(with: childs, parent: snapOFIndex)
            
        } else {
            
            expandSnapshotFor(parent: snapOFIndex)
        }
    
    }
    

}


extension TreeVC {
    
    private func setupCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 50)
        treeCollectionView.collectionViewLayout = layout

        treeCollectionView.delegate = self
    }
    


    private func makeDataSource(cellRegistration: UICollectionView.CellRegistration<StructCell, Tree>) -> DataSource {
        return DataSource(collectionView: treeCollectionView) { collectionView, indexPath, itemIdentifier in
                collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                             for: indexPath,
                                                             item: itemIdentifier)

        }

    }

    func applyRootSnapshot(with treeItem: [Tree], animatingDifferences: Bool = true) {
        snapshot.append(treeItem, to: nil) // root


        dataSource.apply(snapshot, to: .main, animatingDifferences: animatingDifferences)
    }
    
    
    func applyChildsSnapshot(with childs: [Tree], parent: Tree, animatingDifferences: Bool = true) {
        let index = dataSource.indexPath(for: parent) ?? IndexPath()

        snapshot.append(childs, to: parent)
        if parent.childnodecount != 0 {
            snapshot.expand([parent])
            expandedSections.insert(parent)
        }

        treeCollectionView.reloadData()
        dataSource.apply(snapshot, to: .main, animatingDifferences: animatingDifferences)
    }
    
    func expandSnapshotFor(parent: Tree, animatingDifferences: Bool = true) {
       
        if parent.childnodecount != 0 {
            if snapshot.isExpanded(parent) {
                snapshot.collapse([parent])
                expandedSections.remove(parent)

            } else {
                snapshot.expand([parent])
                expandedSections.insert(parent)

            }
        }
        treeCollectionView.reloadData()
        dataSource.apply(snapshot, to: .main, animatingDifferences: animatingDifferences)
    }

    func selectedSnapshotHasChilds(indexPath: IndexPath) -> Bool {

        guard let treeIndex = self.dataSource.itemIdentifier(for: indexPath) else {return false}


        let snapOFIndex = snapshot.snapshot(of: treeIndex, includingParent: false)
        let hasChildren = snapOFIndex.items.count > 0
        return hasChildren

    }

    
    
}




