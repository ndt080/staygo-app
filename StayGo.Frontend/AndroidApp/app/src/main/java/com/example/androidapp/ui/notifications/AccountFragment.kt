package com.example.androidapp.ui.notifications

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.androidapp.R
import com.example.androidapp.databinding.FragmentAccountBinding

class AccountFragment : Fragment() {
    private lateinit var notificationsViewModel: NotificationsViewModel
    private var _binding: FragmentAccountBinding? = null

    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        notificationsViewModel =ViewModelProvider(this).get(NotificationsViewModel::class.java)

        _binding = FragmentAccountBinding.inflate(inflater, container, false)
        val root: View = binding.root

        val appNameField = root.findViewById<TextView>(R.id.field_app_name)
        appNameField.text = "StayGo";

        val appVersionField = root.findViewById<TextView>(R.id.field_app_version)
        appVersionField.text = "v0.1";

        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}