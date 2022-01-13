package com.example.androidapp.ui.map

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.androidapp.R
import com.example.androidapp.utils.DataUtil
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.example.androidapp.models.Bar
import com.google.gson.Gson

class MapActivity : AppCompatActivity(), OnMapReadyCallback {
    private lateinit var mMap: GoogleMap
    private var bars = DataUtil().bars;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.map_view)

        val gson = Gson();
        val arguments = intent.extras
        if(arguments != null) {
            val itemString = arguments.get("item")!!.toString()
            bars = mutableListOf<Bar>(gson.fromJson(itemString, Bar::class.java));
        }

        val mapFragment = supportFragmentManager.findFragmentById(R.id.mapView) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap

        if(bars.count() > 1) {
            for (bar in bars) {
                val location = LatLng(bar.locationX, bar.locationY)
                mMap.addMarker(MarkerOptions().position(location).title(bar.name))
            }

            mMap.uiSettings.isZoomControlsEnabled = true
            mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(LatLng(53.89074, 27.54478), 12.0f))
        } else {
            val location = LatLng(bars[0].locationX, bars[0].locationY)
            mMap.addMarker(MarkerOptions().position(location).title(bars[0].name))
            mMap.uiSettings.isZoomControlsEnabled = true
            mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(location, 18.0f))
        }
    }

//    override fun onMarkerClick(p0: Marker): Boolean {
//        TODO("Not yet implemented")
//    }

}
