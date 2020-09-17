package edu.wpi.cs.kjsmith.project3

import android.app.Activity
import android.content.Intent
import android.content.res.Resources
import android.graphics.drawable.Drawable
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProviders

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val currentFragment: Fragment? = supportFragmentManager.findFragmentById(R.id.fragment)

        if (currentFragment == null) {
            val fragment: Fragment = MainFragment()
            supportFragmentManager.beginTransaction().add(R.id.fragment, fragment).commit()
        }
    }
}