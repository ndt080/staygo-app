package com.example.androidapp.ui.map

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.androidapp.R
import androidx.lifecycle.ViewModelProvider
import com.example.androidapp.databinding.FragmentMapBinding
import com.google.android.gms.maps.*
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.example.androidapp.utils.DataUtil
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;


class MapFragment : Fragment(), OnMapReadyCallback {
    private lateinit var mMap: GoogleMap
    private lateinit var dashboardViewModel: DashboardViewModel
    private var _binding: FragmentMapBinding? = null

    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View? {
        dashboardViewModel =
            ViewModelProvider(this).get(DashboardViewModel::class.java)

        _binding = FragmentMapBinding.inflate(inflater, container, false)
        val root: View = binding.root


        val mapView = root.findViewById<MapView>(R.id.mapView);
        mapView.onCreate(savedInstanceState);
        mapView.getMapAsync(this);

        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    override fun onMapReady(googleMap: GoogleMap) {

        mMap = googleMap

        val bars = DataUtil().bars;

        for (bar in bars) {
            val location = LatLng(bar.locationX, bar.locationY)
            mMap.addMarker(MarkerOptions().position(location).title(bar.name))
        }

        val defaultLocation = LatLng(53.89074, 27.54478)
        mMap.moveCamera(CameraUpdateFactory.newLatLng(defaultLocation));
    }
}