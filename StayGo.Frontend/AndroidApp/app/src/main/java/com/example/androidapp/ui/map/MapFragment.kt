package com.example.androidapp.ui.map

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.androidapp.AppActivity
import com.example.androidapp.MainActivity
import com.example.androidapp.R
import com.example.androidapp.utils.DataUtil
import com.example.androidapp.databinding.FragmentMapBinding
import com.google.android.gms.location.LocationServices
import com.google.android.gms.maps.*
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.Marker
import kotlinx.coroutines.DelicateCoroutinesApi


@DelicateCoroutinesApi
class MapFragment : Fragment() {
    private var _binding: FragmentMapBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View? {
        _binding = FragmentMapBinding.inflate(inflater, container, false)
        val root: View = binding.root

        this.startActivity(Intent(activity as AppActivity, MapActivity::class.java))
        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}