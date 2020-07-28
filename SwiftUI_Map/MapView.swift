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
        return MKMapView(frame: .zero)
    }
    
     // ビューの更新時に呼ばれる
    func updateUIView(_ mapView: MKMapView, context: Context) {
        // 緯度経度を設定
        let latitude = 34.011286, longitude = -116.166868
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        // 縮尺を設定
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        // マップの中心を設定
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)

        // pinを立てる
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate  // ピンを立てる位置設定
        annotation.title = "Hello, World"   // ピンのタイトル設定
        annotation.subtitle = "hoge"        // タップしたときの詳細設定
        mapView.addAnnotation(annotation)   // ピンをマップビューに追加


    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
