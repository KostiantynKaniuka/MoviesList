//
//  ViewController.swift
//  MoviesList
//
//  Created by Константин Канюка on 31.08.2022.
//

import UIKit

class MoviesListViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var moviesTableView: UITableView! {
        didSet {
            moviesTableView.delegate = self
            moviesTableView.dataSource = self
            moviesTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: idCell)
        }
    }
    
    //MARK: - Properties
    private let idCell = "MoviesCell"
    private var generatedList:[String] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction func addToList(_ sender: Any) {
        var model = ListCreationLogic(title: titleTextField.text ?? "",
                                      year: Int(yearTextField.text ?? "") ?? 0,
                                      generatedModelList: generatedList)
        model.generationOfList()
        generatedList = model.generatedModelList
        moviesTableView.beginUpdates()
        moviesTableView.insertRows(at: [IndexPath(row: generatedList.count-1, section: 0)], with: .automatic)
        moviesTableView.endUpdates()
    }
    
}

//MARK: - TableViewDelegate
extension MoviesListViewController: UITableViewDelegate {
    
}

//MARK: - TableViewDataSource
extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generatedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! CustomTableViewCell
        cell.cellLabel.text = generatedList[indexPath.row]
        return cell
    }
}
