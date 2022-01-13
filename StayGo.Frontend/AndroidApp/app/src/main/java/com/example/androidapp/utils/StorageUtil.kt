package com.example.androidapp.utils

import android.app.Activity
import android.content.SharedPreferences
import com.example.androidapp.models.User
import com.google.gson.Gson

const val APP_PREFERENCES = "APP_PREFERENCES";
const val USER_INFO = "USER_INFO";


class StorageUtil(private val activityPreferences: SharedPreferences) {
    private val gson: Gson = Gson();
    private val editor: SharedPreferences.Editor = activityPreferences.edit();

    fun saveStringData(key: String, data: String) {
        editor.putString(key, data);
        editor.apply();
    }

    fun saveUserInfo(user: User) {
        val data = gson.toJson(user);
        editor.putString(USER_INFO, data);
        editor.apply();
    }

    fun getStringData(key: String): String {
        return activityPreferences.getString(key, "") ?: "";
    }

    fun getUserInfo(): User? {
        val data = activityPreferences.getString(USER_INFO, "");
        if(data != "") {
            return gson.fromJson(data, User::class.java);
        }
        return null;
    }

    fun removeStringData(key: String) {
        editor.remove(key);
        editor.apply();
    }

    fun removeUserInfo() {
        editor.remove(USER_INFO);
        editor.apply();
    }
}