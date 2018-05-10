//
//  ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/7/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,  AVCaptureMetadataOutputObjectsDelegate{
    
    @IBOutlet var videoPreview: UIView!
    
    var numMesa = String()
    var avCaptureSession = AVCaptureSession()
    enum error: Error {
        case noCameraAvaible
        case videoINputInitFail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Escanea el codigo QR"
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try scanQRCode()
        } catch {
            print("Error al leer codigo QR")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0 {
            if let machineReadableCode = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                if machineReadableCode.type == AVMetadataObject.ObjectType.qr {
                    numMesa = machineReadableCode.stringValue!
                    performSegue(withIdentifier: "openMenu", sender: self)
                    self.avCaptureSession.stopRunning()
                }
            }
        }
    }
    
    
    
    func scanQRCode() throws {
//        let avCaptureSession = AVCaptureSession()
            guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("No hay camara")
            throw error.noCameraAvaible
        }
        
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else {
            print("Error al iniciar la camara")
            throw error.videoINputInitFail
        }
        
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        let avCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPreviewLayer.frame = videoPreview.bounds
        self.videoPreview.layer.addSublayer(avCaptureVideoPreviewLayer)
        
        avCaptureSession.startRunning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openMenu" {
            let destiantion = segue.destination as! MenuViewController
            destiantion.mesa = numMesa
        }
    }

}

