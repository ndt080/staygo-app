package com.example.androidapp

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.preference.PreferenceManager
import com.example.androidapp.models.Bar
import com.example.androidapp.models.User
import com.example.androidapp.utils.ApiUtil
import com.example.androidapp.utils.DataUtil
import com.example.androidapp.utils.OkHttpRequest
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInAccount
import com.google.android.gms.auth.api.signin.GoogleSignInClient
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.tasks.Task
import com.example.androidapp.utils.StorageUtil
import com.google.android.material.internal.ContextUtils.getActivity
import com.google.gson.Gson
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Response
import java.io.IOException


class MainActivity : AppCompatActivity() {

    lateinit var mGoogleSignInClient: GoogleSignInClient
    private val RC_SIGN_IN = 9001
    lateinit var storage: StorageUtil;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        this.supportActionBar?.hide();

        val activityPreferences = PreferenceManager.getDefaultSharedPreferences(this@MainActivity);
        storage = StorageUtil(activityPreferences);

        if (storage.getUserInfo() != null) {
            loadData();
            return;
        }

        val gso =
            GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN).requestEmail().build()
        mGoogleSignInClient = GoogleSignIn.getClient(this@MainActivity, gso)

        val loginBtn = findViewById<Button>(R.id.google_login_btn)
        loginBtn.setOnClickListener { signIn() }
    }

    private fun signIn() {
        val signInIntent = mGoogleSignInClient.signInIntent
        startActivityForResult(signInIntent, RC_SIGN_IN)
    }

    private fun signOut() {
        mGoogleSignInClient.signOut().addOnCompleteListener(this) { }
    }

    private fun revokeAccess() {
        mGoogleSignInClient.revokeAccess().addOnCompleteListener(this) { }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == RC_SIGN_IN) {
            val task = GoogleSignIn.getSignedInAccountFromIntent(data)
            handleSignInResult(task)
        }
    }

    private fun handleSignInResult(completedTask: Task<GoogleSignInAccount>) {
        try {
            val account = completedTask.getResult(ApiException::class.java)
            val user = User(
                id = account?.id ?: "",
                giveName = account?.givenName ?: "",
                familyName = account?.familyName ?: "",
                email = account?.email ?: "",
                photoUrl = account?.photoUrl.toString(),
                idToken = account?.idToken ?: "",
            )
            storage.saveUserInfo(user);
            loadData();
        } catch (e: ApiException) {
            Log.e("failed code=", e.statusCode.toString())
        }
    }

    private fun startAppActivity() {
        this.startActivity(Intent(this@MainActivity, AppActivity::class.java))
    }

    fun loadData() {
        if (DataUtil().bars.isEmpty()) {
            val client = OkHttpClient()
            val request = OkHttpRequest(client)

            request.GET("https://api-staygo.herokuapp.com/api/Bar/GetAll", object : Callback {
                override fun onFailure(call: Call, e: IOException) {
                    println("Request Failure.")
                }

                override fun onResponse(call: Call, response: Response) {
                    val responseData = response.body?.string()
                    val gson = Gson();

                    this@MainActivity.runOnUiThread(Runnable() {
                        run {
                            val result = gson.fromJson(responseData, Array<Bar>::class.java)
                            DataUtil().setBars(result);
                            startAppActivity();
                        }
                    })
                }
            })
        } else {
            startAppActivity();
        }
    }
}