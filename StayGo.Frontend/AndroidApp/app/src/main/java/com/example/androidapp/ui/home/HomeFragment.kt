package com.example.androidapp.ui.home

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.example.androidapp.R
import com.example.androidapp.databinding.FragmentHomeBinding
import android.widget.ListView
import android.widget.Toast

import com.example.androidapp.MainActivity

import android.graphics.Movie

import androidx.recyclerview.widget.LinearLayoutManager

import androidx.recyclerview.widget.RecyclerView

import RecyclerViewAdapter
import android.widget.SearchView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView.LayoutManager
import com.example.androidapp.models.Bar
import com.example.androidapp.utils.DataUtil

class HomeFragment : Fragment() {

    private lateinit var homeViewModel: HomeViewModel
    private var _binding: FragmentHomeBinding? = null

    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View? {
        homeViewModel =
            ViewModelProvider(this).get(HomeViewModel::class.java)

        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        val root: View = binding.root
        val bars = DataUtil().bars;

        val searchView = root.findViewById<SearchView>(R.id.searchView)
        val recyclerView = root.findViewById<RecyclerView>(R.id.recyclerView);
        val layoutManager: LayoutManager = LinearLayoutManager(recyclerView.context)

        val recyclerViewAdapter: RecyclerViewAdapter = RecyclerViewAdapter(bars) { item ->
            println(item)
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

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}