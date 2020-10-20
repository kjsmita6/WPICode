package edu.wpi.cs.kjsmith.basketballcounter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment

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