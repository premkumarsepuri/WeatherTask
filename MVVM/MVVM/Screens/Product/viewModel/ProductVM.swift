//
//  ProductVM.swift
//  MVVM
//
//  Created by prem on 1/3/23.
//

final class productVM  {
    
    var products: [Product] = []
    var eventHandler:((_ event: Event) -> Void)? // Databinding
    
    func fetchProduct() {
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [Product].self, type: EndPointItems.products) { respone in
            self.eventHandler?(.stopLoading)
            switch respone {
            case.success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case.failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func addProduct(parameters: AddProduct) {
        APIManager.shared.request(modelType: AddProduct.self, type: EndPointItems.addProduct(product: parameters)) { result in
            switch result {
            case.success(let product):
                self.eventHandler?(.newProduct(product: product))
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    
    
    /* func fetchProducts() {
     eventHandler?(.loading)
     APIManager.shared.fetchProduct { respone in
     self.eventHandler?(.stopLoading)
     switch respone {
     case.success(let products):
     self.products = products
     self.eventHandler?(.dataLoaded)
     case.failure(let error):
     print(error)
     self.eventHandler?(.error(error))
     }
     }
     } */
    }

extension productVM {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case newProduct(product: AddProduct)
    }
}
