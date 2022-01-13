package com.example.androidapp.ui.home

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.androidapp.R
import com.example.androidapp.databinding.FragmentHomeBinding
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import RecyclerViewAdapter
import android.widget.SearchView
import androidx.recyclerview.widget.RecyclerView.LayoutManager
import com.example.androidapp.utils.DataUtil
import androidx.navigation.fragment.findNavController
import com.google.gson.Gson

class HomeFragment : Fragment() {
    private var _binding: FragmentHomeBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View? {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        val root: View = binding.root
        val bars = DataUtil().bars;
        val gson = Gson();

        val searchView = root.findViewById<SearchView>(R.id.searchView)
        val recyclerView = root.findViewById<RecyclerView>(R.id.recyclerView);
        val layoutManager: LayoutManager = LinearLayoutManager(recyclerView.context)

        val recyclerViewAdapter: RecyclerViewAdapter = RecyclerViewAdapter(bars) { item ->
            println(item)
            val bundle = Bundle()
            bundle.putString("item", gson.toJson(item))
            findNavController().navigate(R.id.navigation_details, bundle)
        };
        recyclerView.layoutManager = layoutManager

        searchView.setOnQueryTextListener(object : SearchView.OnQueryTextListener {
            override fun onQueryTextSubmit(text: String): Boolean {
                return false
            }

            override fun onQueryTextChange(text: String): Boolean {
                recyclerViewAdapter.getFilter().filter(text)
                return true
            }
        })
        recyclerView.adapter = recyclerViewAdapter
        return root
    }

}