//
//  ReaderDiscoveryViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit
import StripeTerminal

class ReaderDiscoveryViewController: UIViewController, DiscoveryDelegate {

    var discoverCancelable: Cancelable?

    // ...

    // Action for a "Discover Readers" button
    func discoverReadersAction() {
        let config = DiscoveryConfiguration(
          discoveryMethod: .bluetoothScan,
          simulated: true
        )

        self.discoverCancelable = Terminal.shared.discoverReaders(config, delegate: self) { error in
            if let error = error {
                print("discoverReaders failed: \(error)")
            } else {
                print("discoverReaders succeeded")
            }
        }
    }

    // ...

    // MARK: DiscoveryDelegate

    // This delegate method can get called multiple times throughout the discovery process.
    // You might want to update a UITableView and display all available readers.
    // Here, we're automatically connecting to the first reader we discover.
    func terminal(_ terminal: Terminal, didUpdateDiscoveredReaders readers: [Reader]) {

        // Select the first reader we discover
        guard let selectedReader = readers.first else { return }

        // Only connect if we aren't currently connected.
        guard terminal.connectionStatus == .notConnected else { return }

        Terminal.shared.connectReader(selectedReader) { reader, error in
            if let reader = reader {
                print("Successfully connected to reader: \(reader)")
            } else if let error = error {
                print("connectReader failed: \(error)")
            }
        }
    }
}
