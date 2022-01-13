package com.example.androidapp.utils

import android.os.Handler
import android.os.Looper
import com.example.androidapp.models.Bar
import com.google.gson.Gson
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Response
import java.io.IOException
import android.view.View
import com.example.androidapp.AppActivity


class ApiUtil {
    fun getBars() {
        val mHandler = Handler(Looper.getMainLooper());

        val client = OkHttpClient()
        val request = OkHttpRequest(client)

        request.GET("https://api-staygo.herokuapp.com/api/Bar/GetAll", object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                println("Request Failure.")
            }

            override fun onResponse(call: Call, response: Response) {
                val responseData = response.body?.string()
                val gson = Gson();

                mHandler.post(Runnable() {
                    run {
                        val result = gson.fromJson(responseData, Array<Bar>::class.java)
                        DataUtil().setBars(result);
                    }
                })
            }
        })
    }
}