//
//  MapView.swift
//  SwiftUI_Map
//
//  Created by Yoshio on 2020/07/28.
//  Copyright © 2020 tukuyo. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        map.addGestureRecognizer(context.coordinator.myLongPress)
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

     // ビューの更新時に呼ばれる
    func updateUIView(_ mapView: MKMapView, context: Context) {
    }

    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        let myLongPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer()

        init(_ parent: MapView) {
            self.parent = parent
            super.init()
            
            self.myLongPress.addTarget(self, action: #selector(recognizeLongPress))
            
        }
        
        @objc func recognizeLongPress(sender: UILongPressGestureRecognizer) {
            if sender.state == .ended {
                if let mapView = sender.view as? MKMapView {
                    // タップした位置を取得
                    let point = sender.location(in: mapView)
                    // mapView上での位置に変換
                    let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
                    // アノテーション作成
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate
                    mapView.addAnnotation(annotation)
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
