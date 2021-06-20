//
//  PaymentSheetViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit
import Stripe
import Moya

class CheckoutViewController: UIViewController {
    
  @IBOutlet weak var buyButton: UIButton!
  var paymentSheet: PaymentSheet?
    let backendCheckoutUrl = URL(string: Constants.USER_DEFAULTS.SERVER_URL + "/deduct_charge")! // Your backend endpoint
    
  override func viewDidLoad() {
    super.viewDidLoad()

    buyButton.addTarget(self, action: #selector(didTapCheckoutButton), for: .touchUpInside)
    buyButton.isEnabled = false

    let moyaService = MoyaProvider<APIModel>()
    moyaService.request(.stripe(req: ChargeDeductRequest())) { (result) in
        switch result {
        case .success(let response):
            print(response)
            break

        case .failure(let error):
            print("Error while createing new user: \(error)")
            break
        }
    }
    
    
    
    // MARK: Fetch the PaymentIntent and Customer information from the backend
    var request = URLRequest(url: backendCheckoutUrl)
    request.httpMethod = "POST"
    let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
      guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
            let customerId = json["customer"] as? String,
            let customerEphemeralKeySecret = json["ephemeralKey"] as? String,
            let paymentIntentClientSecret = json["paymentIntent"] as? String,
            let self = self else {
        // Handle error
        return
      }

      // MARK: Create a PaymentSheet instance
      var configuration = PaymentSheet.Configuration()
      configuration.merchantDisplayName = "Example, Inc."
      configuration.customer = .init(id: customerId, ephemeralKeySecret: customerEphemeralKeySecret)

        self.paymentSheet = PaymentSheet(intentClientSecret: paymentIntentClientSecret, configuration: configuration)

      DispatchQueue.main.async {
        self.buyButton.isEnabled = true
      }
    })
    task.resume()
  }

    
    
    @objc func didTapCheckoutButton() {
        print("mmaa")
      // MARK: Start the checkout process
      paymentSheet?.present(from: self) { paymentResult in
        // MARK: Handle the payment result
        switch paymentResult {
        case .completed:
          print("Your order is confirmed")
        case .canceled:
          print("Canceled!")
        case .failed(let error):
          print("Payment failed: \n\(error.localizedDescription)")
        }
      }
    }
    
}
