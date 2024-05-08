//
//  ProductVC.swift
//  MVVM
//
//  Created by prem on 1/3/23.
//

import UIKit

class ProductVC: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    private var viewModel = productVM()
    
    @IBAction func AddProductListAction(_ sender: Any) {
        let product = AddProduct(title: "iphone")
        viewModel.addProduct(parameters: product)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        // Do any additional setup after loading the view.
    }
    
}

extension ProductVC {
    func configuration() {
        productTableView.register(UINib(nibName: "ProuctCell", bundle: nil), forCellReuseIdentifier: "ProuctCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProduct()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case.loading:
                print("product loading")
            case.stopLoading:
                print("stoploading")
            case.dataLoaded:
                print("data loaded")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                print(self.viewModel.products)
                
            case .error(_):
                print("error")
            case .newProduct(let newProduct):
                print(newProduct)
            }
        }
    }
}

extension ProductVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProuctCell") as? ProuctCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
  
    
}
