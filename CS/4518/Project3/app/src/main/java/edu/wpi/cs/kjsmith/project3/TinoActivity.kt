package edu.wpi.cs.kjsmith.project3

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button

class TinoActivity : AppCompatActivity() {

    val TAG: String = "TinoActivity"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(TAG, "onCreate")
        setContentView(R.layout.activity_tino)

        val thankBtn = findViewById<Button>(R.id.thanks_tino)
        val talkingBtn = findViewById<Button>(R.id.talking_dog)

        thankBtn.setOnClickListener {
            setThanksTino(true)
        }

        talkingBtn.setOnClickListener {
            setThanksTino(false)
        }
    }

    companion object {
        const val THANKS_TINO: String = "edu.wpi.cs.kjsmith.project3.thanks_tino"
    }

    fun setThanksTino(thanks: Boolean) {
        val data = Intent().apply {
            putExtra(THANKS_TINO, thanks)
        }
        setResult(Activity.RESULT_OK, data)
        Log.d(TAG,"setResult")
        finish()
    }
}
