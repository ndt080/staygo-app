package com.example.androidapp.ui.notifications

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.example.androidapp.AppActivity
import com.example.androidapp.R
import com.example.androidapp.databinding.FragmentAccountBinding
import com.example.androidapp.utils.loadImageWithUri
import com.google.android.gms.auth.api.signin.GoogleSignInClient

class AccountFragment : Fragment() {
    lateinit var mGoogleSignInClient: GoogleSignInClient
    private var _binding: FragmentAccountBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?,
    ): View? {
        _binding = FragmentAccountBinding.inflate(inflater, container, false)
        val root: View = binding.root

        mGoogleSignInClient = (activity as AppActivity).mGoogleSignInClient
        val storage = (activity as AppActivity).storage
        val user = storage.getUserInfo();

        if(user != null) {
            val nameField = root.findViewById<TextView>(R.id.user_name)
            nameField.text = user.giveName + " " + user.familyName;
            val emailField = root.findViewById<TextView>(R.id.user_email)
            emailField.text = user.email
            val avatarField = root.findViewById<ImageView>(R.id.profileImg)
            loadImageWithUri(avatarField, user.photoUrl);
        }

        val logoutBtn = root.findViewById<Button>(R.id.logout_btn);
        logoutBtn.setOnClickListener { view ->
            (activity as AppActivity).signOut();
        }

        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}