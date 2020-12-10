//
//  SetViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import UIKit

class SetViewController: UIViewController {
    
    private let setTableView = UITableView()
    private let fsetReuseIdentifier = "setReuse"
    private var fset: FlashcardSet!
    

    init(fs: FlashcardSet) {
        super.init(nibName: nil, bundle: nil)
        self.fset = fs

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Review Set"
        view.backgroundColor = UIColor.white
        
        setTableView.delegate = self
        setTableView.dataSource = self
        setTableView.backgroundColor = UIColor.white
        setTableView.translatesAutoresizingMaskIntoConstraints = false
        setTableView.register(FlashcardSetTableViewCell.self, forCellReuseIdentifier: fsetReuseIdentifier)
        view.addSubview(setTableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            setTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            setTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            setTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            setTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }


}

extension SetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fset.flashcards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: fsetReuseIdentifier, for: indexPath) as? FlashcardSetTableViewCell else { return UITableViewCell() }
        //let fset = fset[indexPath.row]
        cell.configure(for: fset, index: indexPath.row) //fset.flashcards[indexPath.row]
        //cell.delegate = self

        return cell
    }
}

extension SetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // needs to adjust based on definition length
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fs = fset
        let cell = tableView.cellForRow(at: indexPath) as! FlashcardSetTableViewCell

    }
}
