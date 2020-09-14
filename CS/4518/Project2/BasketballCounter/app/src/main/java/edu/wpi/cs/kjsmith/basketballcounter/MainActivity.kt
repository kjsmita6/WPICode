package edu.wpi.cs.kjsmith.basketballcounter

import android.content.res.Resources
import android.graphics.drawable.Drawable
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.lifecycle.ViewModelProviders

class MainActivity : AppCompatActivity() {

    final val TAG: String = "MainActivity"

    lateinit var COURT_BLANK: Drawable
    lateinit var COURT_3: Drawable
    lateinit var COURT_2: Drawable
    lateinit var COURT_1: Drawable

    lateinit var model : ScoreViewModel

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        Log.d(TAG, "onSaveInstanceState")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d(TAG, "onDestroy")
    }

    override fun onPause() {
        super.onPause()
        Log.d(TAG, "onPause")
    }

    override fun onResume() {
        super.onResume()
        Log.d(TAG, "onResume")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(TAG, "onCreate")
        setContentView(R.layout.activity_main)
        model = ViewModelProviders.of(this).get(ScoreViewModel::class.java)

        COURT_BLANK = resources.getDrawable(resources.getIdentifier("court_blank", "drawable", packageName))
        COURT_3 = resources.getDrawable(resources.getIdentifier("court_3pt", "drawable", packageName))
        COURT_2 = resources.getDrawable(resources.getIdentifier("court_2pt", "drawable", packageName))
        COURT_1 = resources.getDrawable(resources.getIdentifier("court_1pt", "drawable", packageName))

        val score_A = findViewById(R.id.score_A) as TextView
        val score_B = findViewById(R.id.score_B) as TextView
        setNum(score_A, model.scoreA)
        setNum(score_B, model.scoreB)

        val btn_A_3 = findViewById(R.id.btn_A_3) as Button
        val btn_A_2 = findViewById(R.id.btn_A_2) as Button
        val btn_A_1 = findViewById(R.id.btn_A_1) as Button

        val btn_B_3 = findViewById(R.id.btn_B_3) as Button
        val btn_B_2 = findViewById(R.id.btn_B_2) as Button
        val btn_B_1 = findViewById(R.id.btn_B_1) as Button

        val btn_reset = findViewById(R.id.btn_reset) as Button

        val court_image = findViewById(R.id.imageView) as ImageView
        when (model.lastPoint) {
            0 -> court_image.setImageDrawable(COURT_BLANK)
            1 -> court_image.setImageDrawable(COURT_1)
            2 -> court_image.setImageDrawable(COURT_2)
            3 -> court_image.setImageDrawable(COURT_3)
            else -> {
                Log.w(TAG, "Unexpected lastPoint " + model.lastPoint)
            }
        }

        btn_reset.setOnClickListener {
            setNum(score_A, 0)
            setNum(score_B, 0)
            model.lastPoint = 0
            court_image.setImageDrawable(COURT_BLANK)
        }

        btn_A_3.setOnClickListener {
            addNum(score_A, 3)
            court_image.setImageDrawable(COURT_3)
        }

        btn_A_2.setOnClickListener {
            addNum(score_A, 2)
            court_image.setImageDrawable(COURT_2)
        }

        btn_A_1.setOnClickListener {
            addNum(score_A, 1)
            court_image.setImageDrawable(COURT_1)
        }

        btn_B_3.setOnClickListener {
            addNum(score_B, 3)
            court_image.setImageDrawable(COURT_3)
        }

        btn_B_2.setOnClickListener {
            addNum(score_B, 2)
            court_image.setImageDrawable(COURT_2)
        }

        btn_B_1.setOnClickListener {
            addNum(score_B, 1)
            court_image.setImageDrawable(COURT_1)
        }
    }

    fun addNum(score: TextView, num: Int) {
        setNum(score, Integer.parseInt(score.text.toString()) + num)
        model.lastPoint = num
    }

    fun setNum(score: TextView, num: Int) {
        if (score.id.equals(R.id.score_A)) {
            model.scoreA = num
        } else if (score.id.equals(R.id.score_B)) {
            model.scoreB = num
        } else {
            Log.w(TAG, "Unexpected TextView ID " + score.id)
        }
        score.text = num.toString()
    }
}