package com.example.androidapp.ui.details

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageButton
import android.widget.ImageView
import android.widget.RatingBar
import android.widget.TextView
import androidx.activity.OnBackPressedCallback
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.example.androidapp.R
import com.example.androidapp.databinding.FragmentDetailsBinding
import com.example.androidapp.models.Bar
import com.example.androidapp.utils.loadImageWithUri
import com.google.gson.Gson
import kotlinx.coroutines.DelicateCoroutinesApi
import java.lang.StringBuilder
import android.content.Intent
import com.example.androidapp.AppActivity
import com.example.androidapp.ui.map.MapActivity


class DetailsFragment : Fragment() {

    private var _binding: FragmentDetailsBinding? = null

    private val binding get() = _binding!!

    @DelicateCoroutinesApi
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View? {

        _binding = FragmentDetailsBinding.inflate(inflater, container, false)
        val root: View = binding.root
        val gson = Gson();
        val itemString = arguments?.getString("item");
        val item = gson.fromJson<Bar>(itemString, Bar::class.java);

        val backBtn = root.findViewById<ImageButton>(R.id.details_back_btn)
        backBtn.setOnClickListener { view ->
            findNavController().navigate(R.id.navigation_home)
        }

        val title = root.findViewById<TextView>(R.id.details_title)
        title.text = item.name

        val barTitle = root.findViewById<TextView>(R.id.bar_title)
        barTitle.text = item.name

        val barType = root.findViewById<TextView>(R.id.bar_type)
        barType.text = item.type

        val barRating = root.findViewById<RatingBar>(R.id.ratingBar)
        barRating.rating = item.rating

        val barAddress = root.findViewById<TextView>(R.id.bar_address)
        barAddress.text = item.address

        val barAvgCheck = root.findViewById<TextView>(R.id.bar_avg_check)
        barAvgCheck.text = StringBuilder().append(item.avgPayCheck).append(" BYN").toString();

        val barDescription = root.findViewById<TextView>(R.id.bar_description)
        barDescription.text = item.description

        val barImg = root.findViewById<ImageView>(R.id.bar_image)
        loadImageWithUri(barImg, item.image);

        val barGeoBtn = root.findViewById<ImageButton>(R.id.bar_location_btn);
        barGeoBtn.setOnClickListener { view ->
            val intent = Intent(activity as AppActivity, MapActivity::class.java)
            intent.putExtra("item", itemString);
            startActivity(intent)
            findNavController().navigate(R.id.navigation_home)
        }
        return root
    }
}